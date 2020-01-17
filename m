Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801EC140682
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2020 10:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgAQJmK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jan 2020 04:42:10 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44876 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgAQJmK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jan 2020 04:42:10 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so21993299wrm.11
        for <linux-input@vger.kernel.org>; Fri, 17 Jan 2020 01:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fJSpgHc3yD6Z1pZTUsyOdx6VDfvKY4lIvAZEvpSs2M8=;
        b=pXHadtWKMOewUDnrPYZ4qe7vDT+OOj7WLgv0EzlBWBgirzm2Rqrt7aQoEs5lY3orh2
         ZQ+xZxrR0sMmzFnFf25dMPQdkjmrMGo2s7IxsIf0ZWCwK/4KZyKjlcE2Bc8EptTYAQrs
         pdj9ZgeT4/J34G+EXqG7bONgQpXlZkn8oMSPkcCSzNCBwhTv30R1ewcryLGGZ/BaXVJW
         r6G17aMWbzmJcQ1PVgc7YHTXCe8J+2HaZ7Hef+GuPTApxpQ/l8sZoEddSzWKg1gqhH71
         0r2//NpVGb2ozrrSlUO6n59M/qiLsKaEEBKxdjoK9F7npsml1n9IZWHp7AcGGMIJXWUE
         bdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fJSpgHc3yD6Z1pZTUsyOdx6VDfvKY4lIvAZEvpSs2M8=;
        b=MulBDGGmSkEttxJPiQGw1M4g1xHr9l6LADNRlDTokYD5AGMyJr2SUq0tAdwSyASZh5
         4DTGyduqgr4yj0ptrQShvSc2RkMWq2NsRfHmUomTXzCFiGvtcjaYnJrxWfszvhYroqON
         POYYnBHVRRMCQzI6BBLXcMB1QTEi+srHyKcwGatPRhr0u/GyXeMRr6ZF0Ek12yR4b/eZ
         GLRVMt+EOV4eSD3wLPtM/RZ2tM6ZWfjZAAcKDm7ZXswlqzSW6ZFoM807rvK7CFv7WaIh
         riV8YV2p1Ojt7M3ryBPTTFCSt7uOg8NDkSFuFjytTvc3gNIK4aNskVU6iEu2w7/e7IMI
         DqhQ==
X-Gm-Message-State: APjAAAXERxSTgCyt90DN9KVL8Ct0tPGHT+8jzmP9HcEPM3PVAidGjY8J
        yw7shF1N5vPKD39tqyqn3DY=
X-Google-Smtp-Source: APXvYqw4OUk5CWXU6AcFf9MN1vb0zVuoBmW74btCQNeX1lez0//jeNY8J2rBRO6n4tG/MIzD68ksyA==
X-Received: by 2002:a5d:5345:: with SMTP id t5mr2252349wrv.0.1579254127944;
        Fri, 17 Jan 2020 01:42:07 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id l3sm30280136wrt.29.2020.01.17.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:42:07 -0800 (PST)
Date:   Fri, 17 Jan 2020 10:42:06 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Cc:     "Leutwein Tobias (BEG/ENC1)" <Tobias.Leutwein@de.bosch.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [RFC] linux-input alps - loosing precision
Message-ID: <20200117094206.xu47p6ybxmsf5ne2@pali>
References: <988f2b799a6046af87a25c996ebbfacb@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <988f2b799a6046af87a25c996ebbfacb@de.bosch.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thursday 09 January 2020 14:26:16 Leutwein Tobias (BEG/ENC1) wrote:
> Hello,
> 
> At the file
> https://github.com/torvalds/linux/blob/master/drivers/input/mouse/alps.c
> I've seen that values coming from the trackpoint/trackstick are divided at some devices, which results in a loss of precision.
> 
> As I was not lucky with the behavior of the trackpoint of my computer I've made a fork of libinput https://gitlab.freedesktop.org/leutwe/libinput/tree/master/
> where I changed  src/filter-trackpoint.c . With this change, the values from lib evdev are multiplied by a factor (dpToFac_au16 []). The array element used from dpToFac_au16 [] is also the value received by evdev.
> 
> At higher forces I use a factor much higher than 1, so the undivided value from the device would be the best for me.
> 
> In order not to change the behavior for other users, it might be possible to change the divider at runtime via the sys- file system - like it is at trackpoint.c and take the currently used divider as default value.
> 
> Positions at source code were I see the division:
> 
> alps_process_trackstick_packet_v3()
> /*
> * The x and y values tend to be quite large, and when used
> * alone the trackstick is difficult to use. Scale them down
> * to compensate.
> */
> x /= 8;
> y /= 8;
> 
> alps_process_packet_v6()
> /* Divide 4 since trackpoint's speed is too fast */ input_report_rel(dev2, REL_X, (char)x / 4); input_report_rel(dev2, REL_Y, -((char)y / 4));

Hello Dmitry!

This problem is about fact that alps.c for some ALPS devices already
truncate precision of trackpoint movement.

Tobias is unhappy with this fact and would like to get all bits of
movement information, not just some high.

But existing userspace application expects that for these devices kernel
already truncate precision and process truncated data from kernel.

Now question is: Are we able to send to userspace input data without
doing truncation and without breaking existing applications?

It looks like that for such thing we need some userspace <--> kernel API
which disable truncating of precision.

Have you been solving similar issue for other other drivers or in other
area of input code?

-- 
Pali Rohár
pali.rohar@gmail.com
