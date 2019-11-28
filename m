Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6EB10C922
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2019 14:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfK1NEI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Nov 2019 08:04:08 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:44919 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfK1NEI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Nov 2019 08:04:08 -0500
Received: from [192.168.1.155] ([95.117.37.214]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7zNt-1hmw9F0jwp-014znu; Thu, 28 Nov 2019 14:04:06 +0100
Subject: Re: [PATCH] input: misc: Kconfig: use select instead of depends on
 KEYBOARD_GPIO
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20191121132046.11977-1-info@metux.net>
 <20191122195810.GD248138@dtor-ws>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <5600986e-239c-88a9-4f9c-ca261c33a156@metux.net>
Date:   Thu, 28 Nov 2019 14:03:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122195810.GD248138@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:os83iEyCY0j6RVrNxP4Hm5JyZI3u36v6bKf2gADvY60LVEyvW6R
 OS0f3wMnnl+JKqLt+ZptE5miYhHpeP3iw/Ig0gB0w1azVXHsDMI7ir6gBbjb068qSIDweEY
 BMvZRGf6YkJkgE5UZ/p59tZx67xENZHC1PUYqW1hfrVW11j2Q12g6SMrFFjCPQmqo3WAdN0
 d7jVigFH6mH35C2eS9sIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vMCE3ttNetc=:fwnmfwxKx2kQy3o0xUqdbk
 NqFEjlLrcYGmCOBZKgeCl3+t0YfOZTczc/3Zx1Wz67VkhqW3sik3mZXkqFU0+oTbjOVs/jwvC
 49jsCYrCR0ejVQws5p61E/RHHUwAuPiY+RlipouGOzvLkRhMxhC9vlWCohg4qewHGEEElrtbb
 iXaaTIckby32iLGmQIyraeONHccYk/c17epikRYdg0z1bB4Qedaeg5W4cvLHhtU4MTsU8sHgh
 Sn6Ol3Y4QRYKcvQxfbxWqaD1b+pR7rsDpv+0SDs9Ca3UMQjd+cziGKvqyYf5mql9mEFJoNNY8
 dnydnkP2ti/eZaVYGsSqC/cwng58khlNJMisO/kD2A9k4uf80509PD1P14ZEqhQ0tVcZTWh2J
 H8CbRGxHX9xJbJLyH7fXoPlQhSFvA0FB36eVH34uPsZG2qOSs79XRPO+hUFI9tbIzWo88X+s6
 zySVPddL57Fs3CdIxJ6kV+WyHeMIOxEn15Jg0Ln05zxQaLD2yDJO1c59/losZgxzBeRWkEhwJ
 YAP3f/q0z30f7YpSaoF4rksUbQ+yw62xHCa1o/ZvJO8eS6kdggnE/p0OLVL0hcydpug2bdZzJ
 fTU6DUAUjgXqkqKcxbCeeYjXTHfw4+15gAD5UyT/Z3gQ2QWzFFl98857ZqurRIwCLgRkBbfyu
 cX40S0b0G3WZuyw5Vjloz2FHh4aKCGD7MGP+yOcxsb+qQAmZFTp5VTDf1wSw8r+bL4fvesDKq
 ir/NgHpzENgxALhSuHxIo5xx5zNBDndPhAt5RAkbGzr1Dv+m0byxa1QxlW9/76z0hEVL9KA2z
 fwajE6ahACm9hyUOYMdDSZ7ViroZOSS2U3i8DVB/2qmI4UZS1dWTnWfadXI4R6FvQY4aqs22j
 iKNnGFz+rVz60xquQjpA==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 22.11.19 20:58, Dmitry Torokhov wrote:

> KEYBOARD_GPIO depends on GPIOLIB and "select" does not propagate
> dependencies, so you may still end up with invalid configs...

Sure that they don't propagate ? In this case, I've got yet
another todo ... :o


--mtx

-- 
Dringender Hinweis: aufgrund existenzieller Bedrohung durch "Emotet"
sollten Sie *niemals* MS-Office-Dokumente via E-Mail annehmen/öffenen,
selbst wenn diese von vermeintlich vertrauenswürdigen Absendern zu
stammen scheinen. Andernfalls droht Totalschaden.
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
