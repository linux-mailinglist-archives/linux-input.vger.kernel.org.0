Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE8B884A9C
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2019 13:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbfHGL15 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Aug 2019 07:27:57 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:35340 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728365AbfHGL15 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Aug 2019 07:27:57 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 463Tkz0glTz1rYGY;
        Wed,  7 Aug 2019 13:27:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 463Tky6mG3z1r4hg;
        Wed,  7 Aug 2019 13:27:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id pinjiPdxBdhu; Wed,  7 Aug 2019 13:27:53 +0200 (CEST)
X-Auth-Info: CuQW38muQ3wRxojZA3Wc1aAzJ0eDvzdl/OdzbpgORzw=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed,  7 Aug 2019 13:27:52 +0200 (CEST)
Subject: Re: [PATCH 1/2] Input: ili210x - Add DT binding for the Ilitek
 ILI2117 touch controller
To:     Rob Herring <robh@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>, devicetree@vger.kernel.org
References: <20190302141704.32547-1-marex@denx.de>
 <20190327194425.GA641@bogus>
From:   Marek Vasut <marex@denx.de>
Message-ID: <2b9ecd9d-c383-5686-c8f8-9ba88096fbf9@denx.de>
Date:   Wed, 7 Aug 2019 13:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190327194425.GA641@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 3/27/19 8:44 PM, Rob Herring wrote:
> On Sat,  2 Mar 2019 15:17:03 +0100, Marek Vasut wrote:
>> Add DT binding for the Ilitek ILI2117 touch controller, which is yet
>> again a slightly different device in the ILI21xx family.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Henrik Rydberg <rydberg@bitmath.org>
>> Cc: Olivier Sobrie <olivier@sobrie.be>
>> Cc: Philipp Puschmann <pp@emlix.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> To: linux-input@vger.kernel.org
>> ---
>>  Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Bump ? I noticed these patches were never applied.
