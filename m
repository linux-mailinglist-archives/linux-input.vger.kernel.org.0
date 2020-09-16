Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EF826C6DA
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 20:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgIPSEl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 14:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbgIPSDl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 14:03:41 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DB1C06174A;
        Wed, 16 Sep 2020 11:03:39 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b124so4403497pfg.13;
        Wed, 16 Sep 2020 11:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jtd+v1r7yFCDwGBOouA+wJLSIZj7EYucgtKvBQ472aI=;
        b=cTa6gKMf5MByKmHhZnSkM165n0VLREb/jbRMq8LQhka3+P4oYALaD9q/ao3GBhxdPH
         jMQtMEyj++4c4PcPHf2tNjhuDehBXfWdJa/PVgAie/cEkbei5QezHTpWA8XDwOhDoGxO
         PKMZqwBZYVXbHW1wP5ArC6O8PbTAGrIF1Ksrc15a9JKmdWSZH0Y4HPUrDWuzeSPt481X
         PA+m20QNakZcTsNdFxTU4HQSxHKLcpQ50e97YngIQsBoKvV/aCGh30orHF+vk43INisd
         J5kXpp3EkwpI2KXVDtEk52iYJ+jS3gTH6yb/oqI5D0rjKQ4PoOXcJBfj1f5Paqtcjxm/
         dKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jtd+v1r7yFCDwGBOouA+wJLSIZj7EYucgtKvBQ472aI=;
        b=eGzVsxdpN4L2SiRQN3zZI3EfPqi0XYib8tK4TmWiCBve93bwY3mBOyiUikFLzxQjJ5
         amW5FrPUm+gIQW1kMXOApwuZC1gu6Oh5tflZ+b4xDR6Le3YM10XIwr/aWhWJMPtpr2mH
         uAEY7HWYOwfIhzKYyzZyMH/I3POanA63RPJLks3xB4wj56SGouHNuZpRxrg92Rq05ABf
         sl6BlybBrvjUZ3aQr24cSKZaEXo+mo1g+w98Qu6stUCGHojWPz2Ake3gGVhuII3glccn
         r9TrYhQ4Nbx27m57aeYJCpQ+ZJUImQAtGnnGNhfrPtH6CNxHydTdCE5jcZaTuXoC9Diq
         yqaA==
X-Gm-Message-State: AOAM530HV8MQFSzd+Y8/PmoX3vxndpXo03JTuZVsq8+3NBHgSRcudx/r
        x3maPMGxW77x4SuymYjOB+U=
X-Google-Smtp-Source: ABdhPJzuB1Va430uunETuDeXzaGyqFT1vMNiu49dAXULQmwVIvgIvYQAP7lQURIkJDjMsJggSKN96w==
X-Received: by 2002:a65:66c6:: with SMTP id c6mr19860991pgw.206.1600279418834;
        Wed, 16 Sep 2020 11:03:38 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v5sm17634372pfv.199.2020.09.16.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 11:03:38 -0700 (PDT)
Date:   Wed, 16 Sep 2020 11:03:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Harry Cutts <hcutts@chromium.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c - fix typo for an attribute to show
 calibration count
Message-ID: <20200916180335.GL1681290@dtor-ws>
References: <1600238783-32303-1-git-send-email-johnny.chuang.emc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600238783-32303-1-git-send-email-johnny.chuang.emc@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 16, 2020 at 02:46:23PM +0800, Johnny Chuang wrote:
> Fixed typo for command from 0xE0 to 0xD0.
> 
> commit cf520c643012 ("Input: elants_i2c - provide an attribute
> to show calibration count")
> 
> There is an non-touch case by non-calibration after update firmware.
> Elan could know calibrate or not by calibration count.
> The value of '0xffff' means we didn't calibrate after update firmware.
> If calibrate success, it will plus one and change to '0x0000'.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>

Applied, thank you.

-- 
Dmitry
