Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C32F91E5BD
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 01:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbfENXqy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 May 2019 19:46:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34526 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfENXqy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 May 2019 19:46:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id j24so838702ljg.1
        for <linux-input@vger.kernel.org>; Tue, 14 May 2019 16:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version;
        bh=hEQJQd/6vN8A0RwTkBEULHZL5kAUvJ4/4wQCOTOAcos=;
        b=VxR0eBiPuptxJS7cu6wEuLc1E5/tk2YaPn+JHbMDWQLxmKRUnetUUlPOsdX0JC26BI
         sR1JioXKT5EUkKuF0e9eeeE/LEEXreN+wulLBOb6Hquz54041qW2LnrUVtBd88SoozL2
         jNPOG1EGykXQ+Lk7KsBDVmS9PmtWZCITgnfNckmo/h8RIMJ2MsctiJcORmnHCG/OZSXy
         fHAI0DbpH2W9i8eMUGu/YMaQaplRq6+ZhBsskOMFQSHySBJ56tIXohQ4cDUjYZXWXpXA
         ZlvFQ3/WfnvZjkgIhVCFJWD5j8Q1u6rPt/QhurmjGyUoxqA2hF7vEyoX48bOBRAFCS6U
         mu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version;
        bh=hEQJQd/6vN8A0RwTkBEULHZL5kAUvJ4/4wQCOTOAcos=;
        b=Do8VdW+KeeQdoFUvjyCOnT8dcbai1CCqshCN/GJSVyWBiJyUUm9+oLRl5RX6YUEuQW
         5XtVnepraNr9KvxthsrIS0SHp6fc4L0fsvtvourBuiDMgrWzsLKzbidb/v7HYxY8znep
         bwBE0bwpsn3Bxpu0dRZWysiVZukYoVX9YrlhgF63gsfTjrxP466FOcIaNEiNI5+qtd/4
         dBbj8oMLZCC7KjGRo8IvldplxN1zDfrfa8bVra4dXk4nrKT5u0nvaRf/CgvnNA0yTRgG
         tupvLkVeaLEFD5bLm1toRF/uIA+vQXychYf6Xg2TNRrzdI5ZBKNs+ry4UR6XEi5UwkB6
         yqNw==
X-Gm-Message-State: APjAAAWC+fV5zU223eay2vrL+E+8cV53Le5zmHRdO8lk5qnVolc7RHz9
        fEfxPlHciel6iTX8pmJbW2o=
X-Google-Smtp-Source: APXvYqywWmNinXExaXDKTfJuwIuiz8EE4+HzPKoNFoqsTPvf8zyf1X6sRI2W+0PZpX59yeXO9dxwTg==
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr18383833ljc.85.1557877611843;
        Tue, 14 May 2019 16:46:51 -0700 (PDT)
Received: from [192.168.1.16] ([145.255.2.109])
        by smtp.gmail.com with ESMTPSA id q21sm46714lfa.84.2019.05.14.16.46.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 16:46:51 -0700 (PDT)
Date:   Wed, 15 May 2019 04:46:49 +0500
From:   Alexander <exalm7659@gmail.com>
Subject: Re: [PATCH] Input: synaptics - enable SMBus on ThinkPad E480 and E580
To:     Teika Kazura <teika@gmx.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-Id: <1557877609.2.1@gmail.com>
In-Reply-To: <20190514.211132.163893957692107837.teika@gmx.com>
References: <20190421131156.9631-1-exalm7659@gmail.com>
        <CAO-hwJ+U5Y53XNVFwgf4y72hNOU1=zEFOrrjtB4=2Cg6ur18rw@mail.gmail.com>
        <20190514.211132.163893957692107837.teika@gmx.com>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Yes, both work fine so far. In fact, I sometimes had non-working 
touchpad after suspend *without* psmouse.synaptics_intertouch=1, but 
never with it and/or with the patch applied. Thanks!

(re-sending, I've accidentally sent it in HTML first)

On Tue, May 14, 2019 at 5:11 PM, Teika Kazura <teika@gmx.com> wrote:
> Hi, Alexander. If your patch is ok after suspend/hibernation (aka 
> s2ram/s2disk), write so and add Benjamin to the cc list:
>  Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> It's likely he'll give reviewed-by to your patch.
> # I'm not a kernel developer; simply helping with this ps2 -> rmi4 
> issue.
> 
> Regards,
> Teika
> 
> From: Alexander Mikhaylenko <exalm7659@gmail.com>
> Subject: [PATCH] Input: synaptics - enable SMBus on ThinkPad E480 and 
> E580
> Date: Sun, 21 Apr 2019 18:11:56 +0500
> 
>>  They are capable of using intertouch and it works well with
>>  psmouse.synaptics_intertouch=1, so add them to the list.
>> 
>>  Without it, scrolling and gestures are jumpy, three-finger pinch 
>> gesture
>>  doesn't work and three- or four-finger swipes sometimes get stuck.
>> 
>>  Signed-off-by: Alexander Mikhaylenko <exalm7659@gmail.com>
>>  ---
>>   drivers/input/mouse/synaptics.c | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>>  diff --git a/drivers/input/mouse/synaptics.c 
>> b/drivers/input/mouse/synaptics.c
>>  index b6da0c1267e3..8e6077d8e434 100644
>>  --- a/drivers/input/mouse/synaptics.c
>>  +++ b/drivers/input/mouse/synaptics.c
>>  @@ -179,6 +179,8 @@ static const char * const smbus_pnp_ids[] = {
>>   	"LEN0096", /* X280 */
>>   	"LEN0097", /* X280 -> ALPS trackpoint */
>>   	"LEN200f", /* T450s */
>>  +	"LEN2054", /* E480 */
>>  +	"LEN2055", /* E580 */
>>   	"SYN3052", /* HP EliteBook 840 G4 */
>>   	"SYN3221", /* HP 15-ay000 */
>>   	NULL
>>  --
>>  2.21.0
>> 


