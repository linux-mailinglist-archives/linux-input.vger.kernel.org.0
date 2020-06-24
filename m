Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A16207206
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 13:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390648AbgFXL14 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 07:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389155AbgFXL1z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 07:27:55 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7DEC061573
        for <linux-input@vger.kernel.org>; Wed, 24 Jun 2020 04:27:55 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s10so1871587wrw.12
        for <linux-input@vger.kernel.org>; Wed, 24 Jun 2020 04:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=37c87sVvdFeSZJGm913W0EZIbRqzF40U45OlSDc5WuY=;
        b=f3rzZcsXQxqb+TewvrEb5JcQi/cAJ23eh4zqMGLlQuNJxWkcA2AE3UcbRriy2YQfHO
         Ricz2wbmRbBfHnKE2o9lBUdSIPWJ5ybgD83wAkmzTRgOJj5K3I4DKLfzN3ILu1w0nevQ
         S3a4lrpnEyAaDFNS7l/9iNQ23Jj44QCkBJTeYeSEZxC1IYAHQVQPrqQ/6VFLKg8yAKVK
         3nVn6MCZotJUd9KLuKd/D5t1aXm5ie7zwmE1TIpDJ+H3uA8wDI6KzNcqy+16CuzxVfhN
         XW3yv86ZPdyDDhZkozW79hCUXQcrqYVvayq2VhJRclmfZ3uIYD1157/LUuiKczwsMTsT
         NEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=37c87sVvdFeSZJGm913W0EZIbRqzF40U45OlSDc5WuY=;
        b=pFgNVegTkX5u0zAW4XRAvwW8+cljv6amBN400HF+WUTzLI7OFbsQFn/cAfJMpm8eSg
         yOxo5JwwybjWkOYzcohUDAA5KduyW9qfYBoHs0+qI7XlJVGJ0nXGoSdzvywJWJPjIMUk
         URUJrhr1XpnAwVJxR2+pSfSAmNzYAZP98wibDbzhSxghvrBTIJsGZ2L3BpCQJy66sfK9
         KxzDteY+A/DBvy9vi6kh5NPQX87mk21UR3zKAlkyeP/ljpqkitCKhflj/L7bGUeoytop
         Fi8UHT8PgI9s4r5K3DWzIwtSR6VR3irdU1JrPblozkybb416nqrMFkoLUzvMnPfAPK1z
         DcOw==
X-Gm-Message-State: AOAM532lSe5DsDhQlZkI21nqjYawphaYogZA38f6NQ4gVESIIfCxG6+K
        EfWJ7VbMV79mZwoJ/irN/6+NNsg//uQ=
X-Google-Smtp-Source: ABdhPJwHrFGf5/y+H15hd+WcakvV0z4l04YpiJ0IkI0BTrpGSwK1lB1AbbFNqcYg8FzlBnazrTzOeA==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr3492118wrc.218.1592998073893;
        Wed, 24 Jun 2020 04:27:53 -0700 (PDT)
Received: from [192.168.0.93] (88-113-28-221.elisa-laajakaista.fi. [88.113.28.221])
        by smtp.gmail.com with ESMTPSA id c2sm27590459wrv.47.2020.06.24.04.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 04:27:53 -0700 (PDT)
Subject: Re: Graphics tablets getting INPUT_PROP_DIRECT incorrectly
To:     Peter Hutterer <peter.hutterer@who-t.net>,
        Harry Cutts <hcutts@chromium.org>
Cc:     linux-input <linux-input@vger.kernel.org>, spang@chromium.org,
        Kenneth Albanowski <kenalba@google.com>,
        Jacques Pienaar <jpienaar@google.com>
References: <CA+jURctks30toWAipy-ozvwrh1CsQzZHgAuNRPHdrDY2woufMA@mail.gmail.com>
 <20200624070626.GA18108@koala>
From:   Nikolai Kondrashov <spbnick@gmail.com>
Message-ID: <f39ce5d5-bd5b-bd3f-3ea2-9b2a89ba1eb1@gmail.com>
Date:   Wed, 24 Jun 2020 14:27:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624070626.GA18108@koala>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Peter, everyone,

On 6/24/20 10:06 AM, Peter Hutterer wrote:
 > On Wed, Jun 17, 2020 at 02:39:47PM -0700, Harry Cutts wrote:
 >> Hi Kernel input people,
 >>
 >> On Chrome OS, we've observed a couple of graphics tablets getting
 >> INPUT_PROP_DIRECT set despite them being traditional digitizers
 >> without screens. The two tablets we've seen this for are the Huion
 >> H610PRO (VID:PID 256c:006d) and the UGTABLET 10 inch PenTablet
 >> (28bd:0905). Reverting "HID: input: Set INPUT_PROP_-property for
 >> HID_UP_DIGITIZERS" (8473a93d1ba5385f63a128a285702ccc1d3ae2cc) fixes
 >> the Huinon, at least. (We didn't get a chance to test it with the
 >> UGTABLET.) Do we know if this is a shortcoming of that patch, are
 >> those tablets just describing themselves incorrectly in their HID
 >> descriptors? (in which case I guess we'd just have to add quirks for
 >> them)
 >
 > fwiw, both huion and ugtablet are ones i know are regularly giving me
 > troubles in libinput because what they say they do and what they do isn't in
 > sync. HUION also re-uses usbids. 006d is a relatively new one I think, we
 > have at least 7 different devices with 0256c:006e in libwacom and need to
 > match on the name there, but with the Huion HS610 even that breaks - it uses
 > the same vid/pid *and* name of other devices despite having different
 > properties [1]. HS610, HS64 and your H610PRO all seem to use 000d, so...
 > yay?
 >
 > I've CC'd Nikolai, he has much more kernel-level experience with these
 > devices than I do.

These days, you can't rely on pretty much anything to identify an exact
non-Wacom graphics tablet model. With Huion's I sometimes rely on the special
string descriptor containing tablet parameters in binary, retrieving which has
side effects (switching proprietary mode on).

The only reliable way to deal with them is to only consider their reported
parameters, and not try to derive anything else from any
supposedly-identifying properties.

Regarding the original topic of this thread, it's not clear from the source
code what INPUT_PROP_DIRECT exactly means, but I see that it is synonymous
with the "Pen" (0x02) application collection usage, about which HUT 1.12 [1]
16.1 Digitizer Devices says:

     A digitizer with an integrated display that allows use of a stylus. The
     system must ensure that the sensed stylus position and the display
     representations of that position are the same.

I also see that all replacement graphics tablet report descriptors I
contributed to the kernel use it, and that is incorrect. Shame on me.

The proper fix thus would be to replace the 0x02 usage with 0x01 in
replacement report descriptors, before application collection item, for all
(non-display) graphics tablets. 0x01, according to HUT 1.12 would mean:

     A device that measures absolute spatial position, typically in two or more
     dimensions. This is a generic usage; several specialized types of
     digitizers are distinguished by their attributes.

That would get INPUT_PROP_POINTER assigned to them instead.

However, this might get a bit tricky as it's not always easy to find out which
exact models are display models, and then there's Huion display models, e.g.:

     https://www.huion.com/pen_display/KamvasPro/kamvas-pro-24.html

which likely have the aforementioned identification issues too.

Finally, of course, we have models which don't have replacement report
descriptors we control, but which have 0x02 usage instead of 0x01 in their
firmware (I must have copied that from somewhere after all). OTOH, those
usually don't work (well) out-of-box, so probably not a big deal.

What's the practical implication of having INPUT_PROP_POINTER instead of
INPUT_PROP_DIRECT for a display-equipped graphics tablet?

Nick

[1]: Universal Serial Bus HID Usage Tables (HUT) 1.12
      https://www.usb.org/sites/default/files/hut1_12.pdf
