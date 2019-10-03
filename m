Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA3FCB1FA
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 00:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730978AbfJCWmi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 18:42:38 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37206 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730027AbfJCWmi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Oct 2019 18:42:38 -0400
Received: by mail-pf1-f194.google.com with SMTP id y5so2660880pfo.4
        for <linux-input@vger.kernel.org>; Thu, 03 Oct 2019 15:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LFQYztBsclz7gLcwoyW1BGkjcX1ta6jXGI5O61/gujI=;
        b=Bih956Vu/zNUbpv/Kn3SODrpuB156biRVsAobGK6Y0rdIS022zc/qT/ayNm6o6DZ7s
         1M+PJA7nUp0J8q0Dr7TfGXT4QtWebDCoBpKy5w1zhM3sM6rGJrRB/1tylEC8fmz35cwZ
         J1t+lx6x6CZOnqeUJVuuc0y8AEH8yGE2ewoXhbPcxmTx/Bwvehp5TrxxcF4Qi6qVuV9R
         PGMoFhAw/nnxPz9degVTxe9zQJBSBgojAEzUTpCrX0ju+1B7NN9yfDyrpPogUk7A1ePP
         oEc+cnYC2qEyexiCKvp5c6qglWGGMZmi6YK1l+W9bxFinnDVvGGQdKJoMweNUCZKeTc9
         M4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LFQYztBsclz7gLcwoyW1BGkjcX1ta6jXGI5O61/gujI=;
        b=jmbCXGf9MGOhvnNS+XD6lmh83BjW0Y5V41Arwkm1cw8HaYDV4nTTuLzuZTPtVd2ZXS
         IpLGq31gkmMCOqIHYMERXMBADEpS0D/B57gxwdVgbc/gh92eKditlcubz5Nw/HhPbzXW
         YIWoVP6gMEjpQIjrB2JgTbhmDzeQz1td8JRfKoCYZ93/8WbB/f1diMYqnx9K5rsa7zQh
         brmSw6mdU5BvRoWRFd4f40qOShDDLoZJNpRoDkXhkMqz/ST0bf/H/MiYDaZD+r8izmwK
         efCG3JVb1N9afxZAb8f3dR+zvWcdvCJ7FHMd0Y53CE2SDDQPb0nn7fT6I7Gcyyk06GMM
         9VZA==
X-Gm-Message-State: APjAAAUKlHS5qKLrIUc3snBs98NJCldPTwGn2n18ALK28yGIkhZ32YEn
        tfvMDBd8SMOiJGOt4gU5qTU=
X-Google-Smtp-Source: APXvYqw+jlGh1LCwN70LNvKN1OoOdMO5PDDH5AYUAt3Jev9hR5Lp27ZbKi5qSz/v1RT+FVRR9M94Mg==
X-Received: by 2002:a63:5144:: with SMTP id r4mr3097225pgl.339.1570142555740;
        Thu, 03 Oct 2019 15:42:35 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a8sm4028333pfo.118.2019.10.03.15.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 15:42:34 -0700 (PDT)
Date:   Thu, 3 Oct 2019 15:42:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     linux-input@vger.kernel.org, Chengyu Song <csong@cs.ucr.edu>,
        Zhiyun Qian <zhiyunq@cs.ucr.edu>
Subject: Re: Potential uninitialized variables in subsys input: bcm_iproc_tsc
Message-ID: <20191003224232.GE22365@dtor-ws>
References: <CABvMjLR1FmKNWrvsFF1x24iv218+Px-HUfmRyt7CtqfhZxOgyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABvMjLR1FmKNWrvsFF1x24iv218+Px-HUfmRyt7CtqfhZxOgyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yizhuo,

On Thu, Oct 03, 2019 at 01:29:05PM -0700, Yizhuo Zhai wrote:
> Hi Dmitry:
> 
> Variable "intr_status" and "raw_coordinate" in function
> iproc_touchscreen_interrupt()(
> (drivers/input/touchscreen/bcm_iproc_tsc.c) could be uninitialized if
> regmap_read() returns -EINVAL. But it's directly used later without
> the return check, which is potentially unsafe.
> 
> Also, we cannot simply return -EINVAL in iproc_touchscreen_interrupt()
> because it is out of the return type: irqreturn_t. The same cases
> happen in function  mx25_tcq_irq() with variable "stat" and function
> mx25_tcq_init() with variable "tgcr".
> 
> Thanks for your time to check this case.

Both of these drivers use MMIO to interact with the hardware, so regmap
failing is purely theoretical possibility.

Thanks.

-- 
Dmitry
