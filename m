Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D741E4247
	for <lists+linux-input@lfdr.de>; Wed, 27 May 2020 14:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgE0M2z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 27 May 2020 08:28:55 -0400
Received: from mail.eclipso.de ([217.69.254.104]:52128 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728143AbgE0M2z (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 08:28:55 -0400
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 6BEFC110
        for <linux-input@vger.kernel.org>; Wed, 27 May 2020 14:28:53 +0200 (CEST)
Date:   Wed, 27 May 2020 14:28:53 +0200
MIME-Version: 1.0
Message-ID: <1751c082bc76cd9b82852a3f53d88f71@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <denk@eclipso.email>
Subject: Re: Re: Re: Re: Add a second working PNP_ID for a T470s
Reply-To: " " <denk@eclipso.email>
To:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc:     <linux-input@vger.kernel.org>
In-Reply-To: <20200527061019.GI89269@dtor-ws>
References: <ff770543cd53ae818363c0fe86477965@mail.eclipso.de>
        <20200424222546.GK125362@dtor-ws>
        <1a56dbaf4c20a4a375da9a6d281b865b@mail.eclipso.de>
        <a6c89d6692bd551617dfaaf9275e7cea@mail.eclipso.de>
        <20200527061019.GI89269@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

thank you very much!
Regarding my additional question about the error message: Is it possible, to omit this error on shutdown?

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
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


