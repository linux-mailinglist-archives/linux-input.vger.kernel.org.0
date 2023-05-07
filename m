Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 001E06F9523
	for <lists+linux-input@lfdr.de>; Sun,  7 May 2023 02:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjEGAFR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 May 2023 20:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjEGAFQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 May 2023 20:05:16 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A010A16374
        for <linux-input@vger.kernel.org>; Sat,  6 May 2023 17:05:15 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6FCFB846AB;
        Sun,  7 May 2023 02:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1683417913;
        bh=cexmqlb+FxHuIEiXRzXHxRbadMCG4LgK9DBGjKks7wc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Mp093lLhnhjqpQkCPmNtFW1U+Mk4p95qFdVtHxXCAHgJg5YEahODDA/GOmOFAC6XN
         ZuCmzPX7pIAMM1nUtsC0CDarQ4bLCLgB+jDfeT6juJzk4jZu5E+Ks++RNez737yh+L
         xx+aJLkMEy8YkUqNXl59nWb0R2PU5/dvw+Hj/9plZMJ4hFEuxepYNoztO1BO3A13dh
         UFbtozcK9I+H7GO8IxK1VEAqVhL2bc7J/eOWUG7OwlY+TbaCxfu3/pyfv45eBC3ajx
         VOmZzqVAIzsTSuAEJyVRQ63GYJHxkJJycBWpCp9pP6jucSkptVLUEhAyzS6L1bcLls
         Kbth9GLgseu7A==
Message-ID: <4388be18-057e-0e7d-2b81-e9689821a96e@denx.de>
Date:   Sun, 7 May 2023 02:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] Input: ili210x - Probe even if no resolution
 information
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
References: <20230217025200.203833-1-marex@denx.de>
 <ZFagieka6H2cRRXi@google.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <ZFagieka6H2cRRXi@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-8.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 5/6/23 20:46, Dmitry Torokhov wrote:
> On Fri, Feb 17, 2023 at 03:52:00AM +0100, Marek Vasut wrote:
>> Probe the touch controller driver even if resolution information is not
>> available. This can happen e.g. in case the touch controller suffered a
>> failed firmware update and is stuck in bootloader mode.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Applied, thank you.

Much appreciated, thanks !
