Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 383276EC7F1
	for <lists+linux-input@lfdr.de>; Mon, 24 Apr 2023 10:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjDXIcb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Apr 2023 04:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjDXIc3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Apr 2023 04:32:29 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C5F1AD
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 01:32:27 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pqrcX-0001fu-6V; Mon, 24 Apr 2023 10:32:25 +0200
Message-ID: <0b83318b-5ae2-9b90-5d5a-11d95f3501c4@leemhuis.info>
Date:   Mon, 24 Apr 2023 10:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] HID: amd_sfh: Support for additional light sensor
Content-Language: en-US, de-DE
To:     Jiri Kosina <jikos@kernel.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230411161901.909940-1-Basavaraj.Natikar@amd.com>
 <nycvar.YFH.7.76.2304131557420.29760@cbobk.fhfr.pm>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
In-Reply-To: <nycvar.YFH.7.76.2304131557420.29760@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1682325148;06b36406;
X-HE-SMSGID: 1pqrcX-0001fu-6V
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 13.04.23 15:57, Jiri Kosina wrote:
> On Tue, 11 Apr 2023, Basavaraj Natikar wrote:
> 
>> There is support for additional light sensors in the SFH firmware.
>> As a result, add support for additional light sensors.
>>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> Applied.

FWIW, there is a report about a hang at boot that was bisected to this
patch. For details see:
https://bugzilla.kernel.org/show_bug.cgi?id=217354

Ciao, Thorsten

P.S. I normally don't track regressions in -next, I just noticed that
report and wanted to let you know about it.
