/* 
 * Atualiza quando o usuário clica na seta de voltar
 */

(function () {
    if (window.localStorage) {

        if (!localStorage.getItem('firstLoad')) {
            localStorage[ 'firstLoad' ] = true;
            window.location.reload();

        } else {
            localStorage.removeItem('firstLoad');
        }
    }
})();


