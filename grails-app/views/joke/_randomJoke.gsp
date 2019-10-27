<div class="dialog">
    <table>
        <tr class="prop">
            <td class="name">
                Joke ${jokeInstance.id}<br/>
                <g:formatDate format="dd-MMM-yyyy" date="${jokeInstance.dateAdded}" />
            </td>
            <td class="value">${jokeInstance.formatBody()}</td>
        </tr>
    </table>
    <br />
</div>
