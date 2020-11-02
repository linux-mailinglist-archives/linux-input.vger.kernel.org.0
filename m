Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB4F2A2994
	for <lists+linux-input@lfdr.de>; Mon,  2 Nov 2020 12:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgKBLdg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 2 Nov 2020 06:33:36 -0500
Received: from mail.eclipso.de ([217.69.254.104]:45116 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728624AbgKBLdN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Nov 2020 06:33:13 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Nov 2020 06:33:13 EST
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 4B285718
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 12:28:08 +0100 (CET)
Date:   Mon, 02 Nov 2020 12:28:08 +0100
MIME-Version: 1.0
Message-ID: <e5e8070deba45d234560a0cda02192c7@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <denk@eclipso.email>
Subject: Re: Re: Re: Re: Re: Re: Add a second working PNP_ID for a T470s
Reply-To: " " <denk@eclipso.email>
To:     <linux-input@vger.kernel.org>
In-Reply-To: <c05d4b07ca19dd6f285a174fc0bd52dd@mail.eclipso.de>
References: <ff770543cd53ae818363c0fe86477965@mail.eclipso.de>
        <20200424222546.GK125362@dtor-ws>
        <1a56dbaf4c20a4a375da9a6d281b865b@mail.eclipso.de>
        <a6c89d6692bd551617dfaaf9275e7cea@mail.eclipso.de>
        <20200527061019.GI89269@dtor-ws>
        <b8944022e5733abf0910c6447bf47b47@mail.eclipso.de>
        <c05d4b07ca19dd6f285a174fc0bd52dd@mail.eclipso.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi again,

as I never got any reply, I would like to ask again, if there is anything I can do to omit the error message (rmi4_physical rmi4-00:
Failed to read irqs, code=-6) on shutdown?

Thank you very much and best
Dennis


--- Ursprüngliche Nachricht ---
Von: " " <denk@eclipso.email>
Datum: 08.06.2020 11:05:54
An: <denk@eclipso.email>
Betreff: Re: Re: Re: Re: Re: Add a second working PNP_ID for a T470s

Hi again,

is there anything I can do to omit the error message (rmi4_physical rmi4-00:
Failed to read irqs, code=-6) on shutdown?

Thanks and best
Dennis


--- Ursprüngliche Nachricht ---
Von: " " <denk@eclipso.email>
Datum: 27.05.2020 14:29:24
An: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Betreff: Re: Re: Re: Re: Add a second working PNP_ID for a T470s

Hi Dmitry,

thank you very much!
Regarding my additional question about the error message: Is it possible,

to omit this error on shutdown?

Thanks and best
Dennis


--- Ursprüngliche Nachricht ---
Von: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Datum: 27.05.2020 08:10:19
An: <denk@eclipso.email>
Betreff: Re: Re: Re: Add a second working PNP_ID for a T470s

Hi Dennis,

On Fri, May 22, 2020 at 01:42:35PM +0200,   wrote:
> Hi Dmitry,
> 
> as far as I can see, there was no reply from you. If so, then I may


have missed that, sorry for that.
> As I said I am not aware of any issues when running the touchpad and


trackpoint with RMI4. The only difference is the mentioned error message


during shutdown, which I would like to get rid of, if possible.
> Can the patch be merged? Anything missing for that?

Sorry, my fault as I have been busy lately and my patch queue grew
really long. The patch is applied, thank you for your work (and
patience).

Thanks.

-- 
Dmitry



---

________________________________________________________
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln

und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


---

________________________________________________________
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln
und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


---

________________________________________________________
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


