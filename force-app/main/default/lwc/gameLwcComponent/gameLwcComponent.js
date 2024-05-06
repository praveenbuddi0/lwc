import { LightningElement, track } from 'lwc';
export default class GameLwcComponent extends LightningElement {


    @track score = 0;
    @track gameElements = [];

    connectedCallback() {
        // Initial setup
        this.addGameElements(5);
    }

    addGameElements(count) {
        for (let i = 0; i < count; i++) {
            this.addGameElement();
        }
    }

    addGameElement() {
        const newElement = {
            id: this.gameElements.length,
            number: Math.floor(Math.random() * 4) + 1
        };

        this.gameElements = [...this.gameElements, newElement];
    }

    handleClick(event) {
        const clickedElementId = parseInt(event.target.dataset.id, 10);
        const clickedElement = this.gameElements.find(element => element.id === clickedElementId);

        if (clickedElement) {
            this.score += clickedElement.number;
            this.gameElements = this.gameElements.filter(element => element.id !== clickedElementId);
            this.addGameElement();
        }
    }
}