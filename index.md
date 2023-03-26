---
layout: page
title: Hugo Samuel Sánchez-Reyes
---

<style>
    .author-image {
        width: 250px;
        height: 250px;
        border-radius: 50%;
        object-fit: cover;
    }
    .contact-link {
        display: inline-block;
        margin-right: 10px;
    }
    .cv-link {
        margin-top: 10px;
    }
    .publication-item {
        margin-bottom: 20px;
        line-height: 1.5;
    }
    .publication-item a {
        text-decoration: none;
        color: #444;
    }
</style>

## Author coordinates

<div style="display: flex; align-items: center;">
    <img class="author-image" src="http://hugosanrocks.github.io/assets/img/Hugo.jpg" alt="Hugo Samuel Sánchez-Reyes">
    <div style="margin-left: 20px;">
        <div style="font-size: 1.5em; font-weight: bold;">Hugo S. Sánchez-Reyes</div>
        <div>
            <a class="contact-link" href="mailto:hugo.sanchez-reyes@univ-grenoble-alpes.fr">hugo.sanchez-reyes@univ-grenoble-alpes.fr</a>
            <a class="contact-link" href="https://github.com/hugosanrocks">GitHub</a>
        </div>
        <div>
            <a class="contact-link" href="https://www.researchgate.net/profile/Hugo_Sanchez-Reyes">ResearchGate</a>
            <a class="contact-link" href="https://scholar.google.fr/citations?user=8gr2DhwAAAAJ&hl=es">Google Scholar</a>
        </div>
        <div class="cv-link">
            <a href="https://github.com/hugosanrocks/hugosanrocks.github.com/blob/master/_includes/cv/CV_Hugo_Sanchez-Reyes.pdf">Access to my CV</a>
        </div>
    </div>
</div>

## Research work

I am a researcher at the Institut de Recherche pour le Développement (IRD) working at the Institute of Earth Sciences (ISTerre), UGA, France. My project involves developing techniques to analyze and classify seismological data to study the evolution of stress in real faults. We are also planning to include independent geophysical observations such as GPS and velocity variation from ambient noise correlation to better understand the dynamics of faults.

## Publications

## 2018

1. <b>Sánchez-Reyes, H. S.</b>, J. Tago, L. Métivier, V. M. Cruz-Atienza and J. Virieux. An evolutive linear kinematic source inversion. <i><b>Journal of Geophysical Research</b></i>, <b> DOI: </b> 10.1029/2017JB015388. [link to journal](https://agupubs.onlinelibrary.wiley.com/doi/10.1029/2017JB015388) <em><a href="https://github.com/hugosanrocks/hugosanrocks.github.com/blob/master/_includes/Sanchez-Reyes_2018_JGR.pdf"><img src="http://hugosanrocks.github.io/assets/img/pdf_image.jpg" alt="" width="15" height="16" border="0"></a></em>
<br>
<br>
2. Jara, J., <b>Sánchez-Reyes, H. S.</b>, Socquet, A., Cotton, F., Virieux, J., Maksymowicz, A., Díaz-Mojica, J., Walpersdorf, A., Ruiz, J., Cotte, N.and Norabuena, E. Kinematic Study of Iquique 2014 Mw8.1 earthquake: understanding the segmentation of the seismogenic zone. <i><b>Earth and Planetary Science Letters</b></i>, <b>DOI: </b> 10.1016/j.epsl.2018.09.025. [link to journal](https://authors.elsevier.com/c/1Xqo3,Ig4DCTm) <em><a href="https://github.com/hugosanrocks/hugosanrocks.github.com/blob/master/_includes/Jara_2018_EPSL.pdf"><img src="http://hugosanrocks.github.io/assets/img/pdf_image.jpg" alt="" width="15" height="16" border="0"></a></em>
<br>
<br>
3. Hjörleifsdóttir, V., <b>Sánchez-Reyes, H. S.</b>, Ruiz-Angulo, A., Ramírez-Herrera, M. T., Castillo-Aja, R., Singh, S. K. and Ji, C. Was the October 9th 1995 Mw8 Jalisco Mexico earthquake a near trench event? <b><i> Journal of Geophysical Research </i> DOI: </b> 10.1029/2017JB014899 [link to journal](https://agupubs.onlinelibrary.wiley.com/doi/10.1029/2017JB014899). <em><a href="https://github.com/hugosanrocks/hugosanrocks.github.com/blob/master/_includes/Hjorleifsdottir_2018_JGR.pdf"><img src="http://hugosanrocks.github.io/assets/img/pdf_image.jpg" alt="" width="15" height="16" border="0"></a></em>


## 2020

1. <b>Sánchez-Reyes, H. S.</b>, Essing, D., Beaucé, E. and Poli, P. The imbricated foreshock and aftershock activities of the Balsorano (Italy) Mw 4.4 normal fault earthquake and implications for earthquake initiation. <i><b>Seismological Research Letters</b></i>, <b>in press</b> <em><a href="https://github.com/hugosanrocks/hugosanrocks.github.com/blob/master/_includes/Sanchez-Reyes_2020_SRL_preprint.pdf"><img src="http://hugosanrocks.github.io/assets/img/pdf_image.jpg" alt="" width="15" height="16" border="0"></a></em>




## Team Meetings

## 2022

[Cycle Team Meetings](http://hugosanrocks.github.io/cycle_team_meetings)

## 2019

[Earthquake precursors](http://hugosanrocks.github.io/reading-group)




## Interests

Inverse problems, uncertainty assessment, seismic source modeling




## Quasi-real-time data

<dl>
  <dt>Station: Huatulco (Oaxaca) </dt><br class="br-dummy">
  <dt>Keyname: HUIG</dt><br class="br-dummy">
  <dt>Location: <br><i>Latitude:</i> 15.769</dt> <i>Longitude:</i> -96.108
</dl>
<div>
   <img src="http://www.ssn.unam.mx/recursos/imagenes/sismogramas/sismogramaHU.gif" class="center-block img-responsive" data-action="zoom" id="sismograma" alt="Sismograma CUIG">
</div>
Data taken from: [SSN webpage](http://www.ssn.unam.mx/sismogramas/)




## Diary

Here is my post list:

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>




## Social networks

Twitter as: [@Hugosanrocks](https://twitter.com/Hugosanrocks)




## Things not related to Seismology

[Other stories](http://hugosanrocks.github.io/Short stories/index.html)




## To-Do

Please let me know any broken link or doubt releated to this site.


[![HitCount](http://hits.dwyl.io/{username}/{project}.svg)](http://hits.dwyl.io/{username}/{project})

