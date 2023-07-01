Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6133744636
	for <lists+linux-input@lfdr.de>; Sat,  1 Jul 2023 05:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjGAD1e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Jun 2023 23:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjGAD1Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Jun 2023 23:27:24 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7379430DF
        for <linux-input@vger.kernel.org>; Fri, 30 Jun 2023 19:38:12 -0700 (PDT)
Received: from [192.168.0.22] (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 769FAA283;
        Fri, 30 Jun 2023 19:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1688179090; bh=eZoRyhfuZW6dBrpDIQMDkujInFY3JuQ92ZhziAru9OE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fuplLB2GFw5vtfyQjVUNYpbyfzDBlnS2615ckCjTlNQ5WyVBrFDY/aC20Zw7bpmUd
         3HyTdEWYVmk/1WXTietbCJp8naJctrla9b+dbZ5rmlWaOcreyrYk8NuwdEZfZGZIs2
         OeYIB0+BAb8PZUCyVcuUTEHoyHPJAZcM0IzZqT5nwA5tizdsia0u1yftRCSUJRUcrX
         4A/A22arRrHNj3tvdWGsCCsynlsLTGe4/L5iEV2Hazm5tJduKSU/QZW8QG3dN6+qun
         gCWTxQSrkdCZTXjRwzAoHoJCEtL3U1Fj4Xr09s5ahcerXGTPzyp64+XNVia5UpkxMF
         ri9yiFUalpSdA==
Message-ID: <e2a0f0ae-eb97-5fcc-11fd-d370275fa06e@endrift.com>
Date:   Fri, 30 Jun 2023 19:38:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] Input: xpad - Additional controller support
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>, Lyude Paul <lyude@redhat.com>
References: <20230607012812.379640-1-vi@endrift.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <20230607012812.379640-1-vi@endrift.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

On 6/6/23 18:28, Vicki Pfau wrote:
> This series includes two patches: one is a fixed resubmit of a previously
> reverted patch (first applied as db7220c48d8d), and the other is a simple
> addition to the VID table for Xbox One controllers.
> 
> Sam Lantinga (1):
>   Input: xpad - Add GameSir VID for Xbox One controllers
> 
> Vicki Pfau (1):
>   Input: xpad - fix support for some third-party controllers
> 
>  drivers/input/joystick/xpad.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

This series has been radio silent for over three weeks. It includes an easy patch as well as a fixed version of the previously reverted patch I submitted. Is there anything else I need to do? I almost forgot about it, but would like to make sure it's addressed at some point.

Thanks
