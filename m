Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508A766D3BF
	for <lists+linux-input@lfdr.de>; Tue, 17 Jan 2023 02:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbjAQBEZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 20:04:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233599AbjAQBEZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 20:04:25 -0500
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663D8222E3
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 17:04:24 -0800 (PST)
Received: from [192.168.2.4] (c3e47541.dsl.pool.telekom.hu [::ffff:195.228.117.65])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006A934.0000000063C5F415.0028A692; Tue, 17 Jan 2023 02:04:21 +0100
Message-ID: <d165768f-9a5e-be85-a1f4-0c3bb92dba76@irl.hu>
Date:   Tue, 17 Jan 2023 02:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] Input: gpio-keys - add support for linux,input-value dts
 property
Content-Language: en-US, hu
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20230116215947.354660-1-soyer@irl.hu>
 <Y8XVKAqSL4AC7MH+@google.com>
From:   Gergo Koteles <soyer@irl.hu>
In-Reply-To: <Y8XVKAqSL4AC7MH+@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2023. 01. 16. 23:52, Dmitry Torokhov wrote:
> Hi,
> 
> On Mon, Jan 16, 2023 at 10:59:47PM +0100, Gergo Koteles wrote:
>> Allows setting the value of EV_ABS events from dts.
> 
> This needs adjustment to the binding documentation.
> 
> Thanks.
> 

Do you mean Documentation/devicetree/bindings/input/gpio-keys.yaml?
The linux,input-value is already there.

Thanks

