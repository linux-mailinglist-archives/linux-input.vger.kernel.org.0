Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADA0E9ED8
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2019 16:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfJ3P0R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 11:26:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54668 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726246AbfJ3P0Q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 11:26:16 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B46175AFE0
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2019 15:26:16 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id 4so1513208wrf.19
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2019 08:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XUSjmf6lNLsXQz6f3tzYNes7m8xtTp5u+HNHorciUdA=;
        b=qukB6umgQLRtVbf2XWT2nT8G2Yg0tK7D+PiunwKsvFnPiMkhwSnkDt+/RWABCu+HQO
         KR3OyMuL01fnkhaKLMtmXurNc5uUO7fPFOonyZlJDVGYD6juSVohAQsqzP1FfZqeKHqM
         p+kgIoU0ScrIktP7rMYSbbka47Gdqt6MQwGy1AhuZlZO6PjWaGsjm/eGuGInwn+2+1rv
         bE5+tpeW+nZlxFCDA8HHPgxHw+QzzRW341aE+YepuOYG7H0N0EmUg7g7BuaLjzfwLa28
         9jPBsLpnqW+Z8f9uV1gLZrwdT62PBb01kX0hFjtdUhb/qzerdSJJqXM2z8OcRv4/Zl9g
         Fa/g==
X-Gm-Message-State: APjAAAWWFsYLa9kbCY+fEny71vO0YkZPMUcYOMp67LiuaX+XVAYxbRAp
        BqdjVQYAEqGrSNjI7elFHKaUZCsiZoSOokdh+9QBFEvebsR1aGGjwMcdxLcJjP+vbf4N58rh+4G
        4SGZTBny8k6DF2tgE6eC95rE=
X-Received: by 2002:a7b:c049:: with SMTP id u9mr61000wmc.12.1572449175200;
        Wed, 30 Oct 2019 08:26:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuXTkACn82N+o5l0N2HQUBwGXv7dhgxrxAvOpU8jlVhBmkRP4XQb/bn1XyeAYdZT3qPPGP6A==
X-Received: by 2002:a7b:c049:: with SMTP id u9mr60988wmc.12.1572449175034;
        Wed, 30 Oct 2019 08:26:15 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id b3sm375834wma.13.2019.10.30.08.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 08:26:14 -0700 (PDT)
Subject: Re: i2c-hid regression in 5.4 (Linus' master)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@jikos.cz>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-input@vger.kernel.org
References: <f52784fe-f1f5-5147-2c10-e93ca7e51805@redhat.com>
Message-ID: <df967598-f15d-903a-12f0-bd69740653c2@redhat.com>
Date:   Wed, 30 Oct 2019 16:26:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f52784fe-f1f5-5147-2c10-e93ca7e51805@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 30-10-2019 16:21, Hans de Goede wrote:
> Hi Jiri, Benjamin,
> 
> I just noticed that commit 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
> was merged as a fix for 5.4 2 days ago.
> 
> I believe that this is a good idea in general as it should fix issues with
> touchscreens / touchpads on various devices. But about a week ago I noticed a
> regression caused by this. Specifically it causes SIS i2c-hid touchscreens to
> stop working. These are used in various devices. I know of at least 4 models,
> some of which are quite popular, which use SIS touchscreens:
> 
> Asus T100HA
> Asus T200TA
> Peaq 10.1" C1010 2-in-1
> Toshiba Click Mini L9W-B
> 
> I submitted a patch fixing the regression as soon as I found it,

Hmm, I intended to put a patchwork link here, here it is:

https://patchwork.kernel.org/patch/11201123/

Regards,

Hans



> there were some questions about this patch, which I did not answer
> immediately (-EBUSY), as back then this was 5.5 material. Now that
> this has been added to 5.4, I've prioritized this and I've answered
> the questions. Assuming you are ok with the approach, we really
> should get my patch added to 5.4, to avoid this change causing
> regressions.
> 
> Regards,
> 
> Hans
