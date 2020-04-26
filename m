Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E6A1B9138
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 17:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgDZPjr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 11:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726143AbgDZPjq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 11:39:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6D5C061A0F;
        Sun, 26 Apr 2020 08:39:46 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u6so14893422ljl.6;
        Sun, 26 Apr 2020 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jr8sEIhRsWxfNNacf5SYVNwcphsrv+FjrP7kBOirJTk=;
        b=QJQd9lMFsyuz1Ad9tC5dPDSbuz6E7T5RKFr1HOh2wjDqGYctUrgypDeDcRSGTieMwJ
         H6NnO4Yc/l0rFQoe8Bj4EtY9otDJShrEeHsg8ZY7iK0Q995Hjle4LFDmqUVFn5H3rdBs
         GNSsSiIdkfqN4Tdx0I8K5P+SpiTGzDh25zUai67okAzGRsG9EkokYvgGv/rn0xtoK9a8
         0Gkuc5k6yNwoWZTAFfsNKt/w29uNdsCn0Lg5VEo2XOLojmlpR2mWBs0ZGxyRYRxkNXBS
         z/UNMaqn8r70R2FS7fXtGgul7YHRlSVoqpX27u8WdbQhiJhHt0XD17hW1Ji11tp83YTq
         RBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jr8sEIhRsWxfNNacf5SYVNwcphsrv+FjrP7kBOirJTk=;
        b=tjR3HcMYBX/Z5f8ErUJ7NJnjWp234rSpWfrNabOWyQTineVcet3WrcQ1XnDrzIuqu+
         XJ2myYayb3t059Unu92naSPNtTaw7dP/R45p9ZziKchXXWkUI4gAyckXm6gqHvAjnlDN
         JcdE+wnbNons8sBKJ2BhdKMf1OgEoqQHZTB2GVPPQfHqdLQcgbhVuKrVQ+3JK/fk4Tld
         sYeRne59vcu4zvQJD6Pdm64L80DZ/DoNy8QtZieWawKNbr8CphCVvZ/0Sj4t2ZgGCeDz
         QLDvx2xOv8mo2IhfBjuja6pKk8SIpROr9aadNYW4Aw35ttkMWrrRfJrhlxGI+TAuirGC
         ELcQ==
X-Gm-Message-State: AGi0Puaz/g7GIuLQb7CaBpVKCvor8lYqpvwGzVDXzxLnr8w0iMhf1Npg
        OP0VbpGBrwyYoN2W8hW/tEfcH7PA
X-Google-Smtp-Source: APiQypK8caj6y5XA1W01MZCky8HR8ADFsCb7Xckwi9U/CjM8blPmWEzu1XrQ5Kcu9YpZutFtVEF1WQ==
X-Received: by 2002:a2e:3c10:: with SMTP id j16mr11618254lja.2.1587915584390;
        Sun, 26 Apr 2020 08:39:44 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a26sm9307079lfl.66.2020.04.26.08.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 08:39:43 -0700 (PDT)
Subject: Re: [PATCH v3 3/9] input: elants: remove unused axes
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
 <20200426045200.GN125362@dtor-ws> <20200426112150.GA16230@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9828df8-c974-3bc2-6ecf-962489cf1189@gmail.com>
Date:   Sun, 26 Apr 2020 18:39:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426112150.GA16230@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 14:21, Michał Mirosław пишет:
> On Sat, Apr 25, 2020 at 09:52:00PM -0700, Dmitry Torokhov wrote:
>> On Mon, Apr 13, 2020 at 03:32:23PM +0200, Michał Mirosław wrote:
>>> Driver only ever reports MT events. Clear capabilities of all others.
>> This is not true. input_mt_sync_frame() calls
>> input_mt_report_pointer_emulation() which does emut single-touch events
>> for the benefit of older userspace (or userspace that is not interested
>> in multitouch).
> 
> Oh, I didn't notice that. Looking at the code, I see that
> input_mt_init_slots() sets up the emulated axes in this case.
> 
> Do you need me to update the commitmsg?

I tried Ubuntu 12.04 that uses ancient libinput (or whatever it was back
then), which doesn't support MT. Mouse doesn't move at all with this
patch being applied. Without this patch mouse moves, but it's not usable
because the cursor's position is wrong, i.e. mouse position doesn't
match the screen touches.

This means that input_mt_report_pointer_emulation() doesn't set up
everything needed for the legacy pointer emulation.
