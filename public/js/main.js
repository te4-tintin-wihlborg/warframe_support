async function get_input(){
    let input = document.querySelector("#input").value 
    let list = input.split(",")
    let data = await get_info(list)
    console.log(data)
}

async function get_info(list){

    const response = await fetch("/get_info", {
        method: 'POST',
        body: JSON.stringify(list)
        
    })

    return await response.json()

} 