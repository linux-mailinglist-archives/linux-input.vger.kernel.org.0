Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB14207A92
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 19:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405665AbgFXRqI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 13:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405587AbgFXRqH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 13:46:07 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC01C061573
        for <linux-input@vger.kernel.org>; Wed, 24 Jun 2020 10:46:07 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y10so3336450eje.1
        for <linux-input@vger.kernel.org>; Wed, 24 Jun 2020 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6qsA+NVCV7X7opaync3ptNKPKKPsYOKF/fg/Zcd7c90=;
        b=EKW3xs0BA3Y7KTZVzuHhh4eJ9/3l3mBmaukW6lyWwEX6U7e6O6u1mRzXmaEBf9Hkv5
         7cWfWymxLDbfKbuY8KOTk55vEdSrytd8CYEEF51EMp3PDjveaTcexqvngHI/A9ZFMSmg
         Wg2OJ+/Ukvc8LbW8pa4H0rPja709NTSu+tWdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6qsA+NVCV7X7opaync3ptNKPKKPsYOKF/fg/Zcd7c90=;
        b=aYBRD6K33DpxcYsyQ4KT6snhdKNnpGbfmKzOVrr+OjUWea0RmgJPrrNBtmSUqvHTWr
         kZUxgbgXtvuyjJs5OoSOy4yvRy41pqaP70yMnqVwWRVY8w38ZVcvgYXbkAdJ034TaxDD
         1uW+o7uruSdnzv94HWVOME5eQaq7Odp8cRxKR5b8an1GSxbk14HINhNatCVqVLngOA3D
         NlDN8B/pJ3iQWVQIAcxFuB0JDtyhrlq88BHaxaSOO78D8a/Em+2j58QzbB5FFDBYSImw
         zMQt5G3Zyk99wOE2wcOveJldIKWVN2zp1dG/xkAi+yhxO4NBGYlAwJy2dRZ77cTpgWlf
         iYaA==
X-Gm-Message-State: AOAM531UeXBiKwSkfjpiO1tflOzws439sY5CaeF8fB9uPYNAC5KIir/4
        nslZlw3pO2DJkfkT2cinREkAyQyuOYw=
X-Google-Smtp-Source: ABdhPJzzz0M1PvB/8eMDtptuK8702PlOmoT9QH5X/Vv2J5P7eCPue37rhLzPDFI2k7/WJgiBuor7lw==
X-Received: by 2002:a17:906:35ce:: with SMTP id p14mr17482629ejb.514.1593020765614;
        Wed, 24 Jun 2020 10:46:05 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id lo20sm9818668ejb.62.2020.06.24.10.46.04
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 10:46:04 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id o11so3113360wrv.9
        for <linux-input@vger.kernel.org>; Wed, 24 Jun 2020 10:46:04 -0700 (PDT)
X-Received: by 2002:a5d:6a8a:: with SMTP id s10mr28769587wru.228.1593020764011;
 Wed, 24 Jun 2020 10:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+jURctks30toWAipy-ozvwrh1CsQzZHgAuNRPHdrDY2woufMA@mail.gmail.com>
 <20200624070626.GA18108@koala> <f39ce5d5-bd5b-bd3f-3ea2-9b2a89ba1eb1@gmail.com>
In-Reply-To: <f39ce5d5-bd5b-bd3f-3ea2-9b2a89ba1eb1@gmail.com>
From:   Michael Spang <spang@chromium.org>
Date:   Wed, 24 Jun 2020 13:45:27 -0400
X-Gmail-Original-Message-ID: <CAC5F_1my6AMFa=azyfy5ZWoss0XdA_2Nfw4fMUZLD8yMzv+O_Q@mail.gmail.com>
Message-ID: <CAC5F_1my6AMFa=azyfy5ZWoss0XdA_2Nfw4fMUZLD8yMzv+O_Q@mail.gmail.com>
Subject: Re: Graphics tablets getting INPUT_PROP_DIRECT incorrectly
To:     Nikolai Kondrashov <spbnick@gmail.com>
Cc:     Peter Hutterer <peter.hutterer@who-t.net>,
        Harry Cutts <hcutts@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        Kenneth Albanowski <kenalba@google.com>,
        Jacques Pienaar <jpienaar@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 24, 2020 at 7:27 AM Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> Hi Peter, everyone,
>
> On 6/24/20 10:06 AM, Peter Hutterer wrote:
>  > On Wed, Jun 17, 2020 at 02:39:47PM -0700, Harry Cutts wrote:
>  >> Hi Kernel input people,
>  >>
>  >> On Chrome OS, we've observed a couple of graphics tablets getting
>  >> INPUT_PROP_DIRECT set despite them being traditional digitizers
>  >> without screens. The two tablets we've seen this for are the Huion
>  >> H610PRO (VID:PID 256c:006d) and the UGTABLET 10 inch PenTablet
>  >> (28bd:0905). Reverting "HID: input: Set INPUT_PROP_-property for
>  >> HID_UP_DIGITIZERS" (8473a93d1ba5385f63a128a285702ccc1d3ae2cc) fixes
>  >> the Huinon, at least. (We didn't get a chance to test it with the
>  >> UGTABLET.) Do we know if this is a shortcoming of that patch, are
>  >> those tablets just describing themselves incorrectly in their HID
>  >> descriptors? (in which case I guess we'd just have to add quirks for
>  >> them)
>  >
>  > fwiw, both huion and ugtablet are ones i know are regularly giving me
>  > troubles in libinput because what they say they do and what they do isn't in
>  > sync. HUION also re-uses usbids. 006d is a relatively new one I think, we
>  > have at least 7 different devices with 0256c:006e in libwacom and need to
>  > match on the name there, but with the Huion HS610 even that breaks - it uses
>  > the same vid/pid *and* name of other devices despite having different
>  > properties [1]. HS610, HS64 and your H610PRO all seem to use 000d, so...
>  > yay?
>  >
>  > I've CC'd Nikolai, he has much more kernel-level experience with these
>  > devices than I do.
>
> These days, you can't rely on pretty much anything to identify an exact
> non-Wacom graphics tablet model. With Huion's I sometimes rely on the special
> string descriptor containing tablet parameters in binary, retrieving which has
> side effects (switching proprietary mode on).
>
> The only reliable way to deal with them is to only consider their reported
> parameters, and not try to derive anything else from any
> supposedly-identifying properties.
>
> Regarding the original topic of this thread, it's not clear from the source
> code what INPUT_PROP_DIRECT exactly means, but I see that it is synonymous
> with the "Pen" (0x02) application collection usage, about which HUT 1.12 [1]
> 16.1 Digitizer Devices says:
>
>      A digitizer with an integrated display that allows use of a stylus. The
>      system must ensure that the sensed stylus position and the display
>      representations of that position are the same.

It means there is a display integrated with the input devices and
applies to both touchscreens and LCD drawing tablets.

>
> I also see that all replacement graphics tablet report descriptors I
> contributed to the kernel use it, and that is incorrect. Shame on me.
>
> The proper fix thus would be to replace the 0x02 usage with 0x01 in
> replacement report descriptors, before application collection item, for all
> (non-display) graphics tablets. 0x01, according to HUT 1.12 would mean:
>
>      A device that measures absolute spatial position, typically in two or more
>      dimensions. This is a generic usage; several specialized types of
>      digitizers are distinguished by their attributes.
>
> That would get INPUT_PROP_POINTER assigned to them instead.
>
> However, this might get a bit tricky as it's not always easy to find out which
> exact models are display models, and then there's Huion display models, e.g.:
>
>      https://www.huion.com/pen_display/KamvasPro/kamvas-pro-24.html
>
> which likely have the aforementioned identification issues too.
>
> Finally, of course, we have models which don't have replacement report
> descriptors we control, but which have 0x02 usage instead of 0x01 in their
> firmware (I must have copied that from somewhere after all). OTOH, those
> usually don't work (well) out-of-box, so probably not a big deal.
>
> What's the practical implication of having INPUT_PROP_POINTER instead of
> INPUT_PROP_DIRECT for a display-equipped graphics tablet?

This case is basically usable. It has the following problems:

(1) The mouse cursor will be drawn under the stylus which is
unnecessary and obscures content.
(2) Rotating the display will throw off the coordinate system and make
the device unusable.
(3) Multiple pen inputs will interfere with each other (e.g for an
interactive whiteboard). This isn't a fundamental problem but stems
from pointer devices just reusing existing mouse APIs which have a
single, global pointer.

Note that POINTER is the default behavior for stylus devices that
report neither DIRECT nor POINTER, so the above problems are status
quo for devices with integrated displays unless they add the DIRECT
property specifically.


>
> Nick
>
> [1]: Universal Serial Bus HID Usage Tables (HUT) 1.12
>       https://www.usb.org/sites/default/files/hut1_12.pdf
