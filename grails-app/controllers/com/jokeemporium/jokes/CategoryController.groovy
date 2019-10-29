package com.jokeemporium.jokes

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.validation.BindingResult

class CategoryController {

    static scaffold = Category

    def index = {
        redirect(action:"list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 15, 100)
        [categoryInstanceList: Category.list(params), categoryInstanceTotal: Category.count()]
    }

    def create = {
        def categoryInstance = new Category()
        categoryInstance.properties = params as BindingResult
        return [categoryInstance: categoryInstance]
    }

    def save = {
        def categoryInstance = new Category(params)
        categoryInstance.description = categoryInstance.description ?: '' // hack for non-nullable DB column
        if (categoryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.id])}"
            redirect(action: "show", id: categoryInstance.id)
        }
        else {
            render(view: "create", model: [categoryInstance: categoryInstance])
        }
    }

    def show = {
        def categoryInstance = Category.get(params.id)
        if (!categoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
            redirect(action: "list")
        }
        else {
            [categoryInstance: categoryInstance]
        }
    }

    def edit = {
        def categoryInstance = Category.get(params.id)
        if (!categoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [categoryInstance: categoryInstance]
        }
    }

    def update = {
        def categoryInstance = Category.get(params.id)
        if (categoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (categoryInstance.version > version) {
                    categoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'category.label', default: 'Category')] as Object[], "Another user has updated this Category while you were editing")
                    render(view: "edit", model: [categoryInstance: categoryInstance])
                    return
                }
            }
            categoryInstance.properties = params as BindingResult
            categoryInstance.description = categoryInstance.description ?: '(empty)'
            if (!categoryInstance.hasErrors() && categoryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.id])}"
                redirect(action: "show", id: categoryInstance.id)
            }
            else {
                render(view: "edit", model: [categoryInstance: categoryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def categoryInstance = Category.get(params.id)
        if (categoryInstance) {
            try {
                categoryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
                redirect(action: "list")
            }
            catch (DataIntegrityViolationException e) {
                log.error(e)
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
            redirect(action: "list")
        }
    }

}
