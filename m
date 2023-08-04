Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF327704C2
	for <lists+linux-input@lfdr.de>; Fri,  4 Aug 2023 17:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjHDPb4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Aug 2023 11:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjHDPbj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Aug 2023 11:31:39 -0400
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Aug 2023 08:31:22 PDT
Received: from abi149hd126.arn1.oracleemaildelivery.com (abi149hd126.arn1.oracleemaildelivery.com [129.149.84.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C69B524A
        for <linux-input@vger.kernel.org>; Fri,  4 Aug 2023 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=lkeyCUNxw6Rc/OPS654INdsxLT2B3j/nzdnoNSEJjig=;
 b=bac6FmIFqM2VTXBwCerNcTs1vGSwGm1YskznsLbPIatRy6FNMCF0GpZOJe6uP/K2LzGhvGvYNKhv
   AFgxcTdVPaxd4yH41nkWVlvrB0QhIJozfiL5zG/LLPyGubxrRLd1XnfMtkq7+MnHH+EsoaXlOUZL
   1SHp9GIChx4CWxEUz7Kg3KlGqZz708Y06INpwUzBMwHQROF+Ameh3i36FxIYtKDOTF3ijsdkn3s4
   yRQf8S8uKtsCbslTRfbZlCLnHauQlg16rPnxNzCjS+0CP3GT5vGI/fj6Yfb3LGeC59Vv7N75+MG7
   7CUrBkZxMIl7yB80aZPpIVc00jbubo89NhzNvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=lkeyCUNxw6Rc/OPS654INdsxLT2B3j/nzdnoNSEJjig=;
 b=UQ/wioqw7YM345lLt/Rg5JZCedZ4CgI/TLJydeYOoOXCWITVJuslpve8uNh1b37zxAIYqD5jUTU2
   8HiF1MxGap3Y4scje345llC3CG5owAQtGVPe5uFR28am1ISnuJbAG7wOcdnWBak/AXb9XCwEr17V
   W0FDraxbITYS3WYQb8qSD27BKLDSOzWtO9LqS2dhB6o4oEQmqu23A+rs/lkMWk11iIDwwLXYTKS+
   LCFFVdUIjITOJhigCifcav24LBQlXvWxWK4AFqAxHCQH6D1mSo05tCgcPWPU91aMbXryEcLw0kzD
   yP7ayI3G+Qe0HlzN35WaXT6vpJtp5TI2gkWpyw==
Received: by omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230707 64bit (built Jul  7
 2023))
 with ESMTPS id <0RYV003OCHJT0G40@omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for linux-input@vger.kernel.org; Fri, 04 Aug 2023 15:26:17 +0000 (GMT)
Message-id: <b7df9a02-3b81-4f8c-aeba-222c298180d4@augustwikerfors.se>
Date:   Fri, 4 Aug 2023 17:26:14 +0200
MIME-version: 1.0
Subject: Re: Fwd: 6.5 - 6.4.7 Regression : ASUS UM5302TA Keyboard don't work
Content-language: en-US
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Linux Input Devices <linux-input@vger.kernel.org>,
        ACPI Asus <acpi4asus-user@lists.sourceforge.net>,
        Linux x86 Platform Drivers 
        <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Guilhem Lettron <guilhem@lettron.fr>
References: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
 <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
From:   August Wikerfors <git@augustwikerfors.se>
In-reply-to: <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta: AAFFfLcUsxW36ThPzjsNnUXQm7U6Sr9gxxLdxvDmieyTQubvanypwsv0aq8t1egt
 VXasQBWsOdnmCguJTPNobAfWd/iC2bEZITKZHp6OaYOiTN/ezuIrgJr69Aem0AqE
 JpJi9V6gButdPp/tUGJv/gImWLhU4OZE9W0I2NloJbUdSQrcRtZHHclwi+Y/vKab
 /iJdXFGKopteWjqKPcrdiTbtTdSQFSWsPM1IM1gqScKvT4v62lx9+41vFuC5hy3v
 sOZ1+yw3PpkzlcsZVGwNethnR40/crO6EY9VMgHd6+cbaFloJpcHfsR+3+MeQ6lB
 Vmw2PN4ywKIR0oBCG7K5RNXBiVK9wohKoct/YFPY35tBK/FQEI/4LkyDf/hyMtTE
 Lde70Xzc8V0uRW3Gsu72qHxHPqDDcyPLvgDChJNX1gKHrk6EJ1+28DnvlM8hrJXn md3qIS8x
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2023-07-30 06:49, Linux regression tracking (Thorsten Leemhuis) wrote:
> Lo!
> 
> On 30.07.23 04:41, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>>> On a kernel 6.4.5 and less, the keyboard is working fine.
>>>
>>> Beginning with 6.5 rc1 and 6.4.7 any key don't respond.
> 
> That is a AMD Ryzen Laptop. And if that really started from
> v6.4.6..v6.4.7 then I guess there is a decent chance that this is caused
> by ```ACPI: resource: Remove "Zen" specific match and quirks``` from
> Mario. Hence adding him to the list of recipients.

Confirmed now, see https://bugzilla.kernel.org/show_bug.cgi?id=217726#c9

#regzbot introduced: a9c4a912b7dc7ff922d4b9261160c001558f9755
