Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E655997697
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 12:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfHUKAm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 06:00:42 -0400
Received: from sonic313-56.consmr.mail.ne1.yahoo.com ([66.163.185.31]:38803
        "EHLO sonic313-56.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726370AbfHUKAl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 06:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1566381641; bh=dcTiwyjf7KOS+zV3lspZxuhObKUMmeaoofozGBWkzpg=; h=Date:From:Reply-To:Subject:From:Subject; b=MFZCwjFYw3ARuxoIDtnxCK99BbnmqkCMEL5bhCatf3dc8FKo64BN0OP+ZLeDKn1a7uVCZ4e6jcezAKEMkyMwD3W3rG2v0/Myk2KeYoebBzepVfYQyAbjIMQBx+ZMN+YDEFHMfPhOqzNPm7VrC56mzSUiVMQB2eZpIddQT3kA42Vm/unBID5T1pejE0/uCet2GMzxslS64PVrL7t7tcN2051k+x0/hkt2pyfd9jGfNSlx6xkoYks3vpL5nFT1wLB/FSF/3dY/rdqLYg9VPMFPw7IYfxbZkDhoIe/yXIaSFirkmUtK7MIUbg1oO5vm3XXmsphpheoxgPJgjX+S6mAdjA==
X-YMail-OSG: WxAKVFEVM1lBB8hn8Wrl_5cBz03M7.YjRhgcRj2VDtOt4D1q9LjlLquNfzoFA7N
 f0qlA4BuGtMb0rtowffWE1sF8AfgE9Vi2pSo5dVkRRvqc2IkAkk9qcc84FCeJ7mtoPy.yJ9pjF6f
 l.ZqHtIHLj4JziQUx3NHd.Rgk10HbsEcWnT7JNvv2TF2rCc2kaDF0eFe2b0Ph6iG_PmtWUWyrh7e
 BvtgdZnNT5T4U_b4QtU8VIJV.5XdKaFLVWBCVrl6dMHf6IdXJyFWOFJENNQrD9KQBC9KzYQkxUDx
 lKJsoPUcO0MlWtz2ZaZ7spF4p0zQwvB6mMEySPsA9pb9c0Bb2lze6xY7cxhsCTt2NtAiVoYk_7kK
 xaXTyrTE9rfPkdml4NVMzPx0TIaj1Kwp9KRdd4jyFCKZVBo.Dfs6fd7dSOsL4Xc4meb5dMpGsa4o
 PSghYfm4azG_wXOMkbpUYDFOdX6KwNYfxuFqWi5zA5vT4ak5jyKz8_2nnRarPa6I62NB89lLewOM
 V3F.SjeXv9cnI_uYcg_9UdEP6F3vv9e8iQf38eshhEEZUS4tayaqAyFE9fp0HZDrCu7opnM7xJNH
 9l415TMKxBhuZHm9aulF.HkHmKMU_FDw5RB3VpAniP.w3Zr4RxoDWji9PEclDKCxms4ee3AhMeOc
 fdglBV3_SzFHmc9xHI7.nAOwB.wLGs1RlBpzzESMsyOVp8YaPh1xhqdzBBJo.9Dmq7qAau4kEV75
 yAiNBRdjEEO.fF2nGFpXUowsAcTj6WEuJ_p3OItmylGCRCwypXfEFOqfFqS4Ti_HFAArKGDi_.T5
 mYxFMDEtIoaVZ9EG2a_Rv8R9j2cLCo96pI9NNTksKobUr7fPrc_Dc6rO_5M7rYSqZbeVRgm.Js3H
 zXkL7U_ldUAjJIpWpzT0PxpQKk8oOdWHgZBXJpKAnCB6LBClJ1cdynuB7Ac5aUoElNYQOChrGlGF
 6XPu85mbh232dJ1O4ivWovP5wIBq_AoE0GJH2TQBumRjyPrimU3WBksu1v4RDRb0rD_snt5.1kTL
 OMkg8TJ4XMMY.v..boYM6zsF2nZg.G5d8BbGoJlOwv7HDFykL1R2rbcCQ2tMjujIB.viD1VHpbbf
 tQx_2vKiuEM5TLYYxheGUED8.tz48CzlRbCWO8DcGvWpM5WsTF7EGrEbTw5G3q_wvu8G6rDMFNfO
 NDmz7PsokusJHOSe5Kxv3KwtuSOUSITu593O6yAzi8qqcRm0f5ODKkHckxsNrWMQiNpsT7ME-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Wed, 21 Aug 2019 10:00:41 +0000
Date:   Wed, 21 Aug 2019 10:00:36 +0000 (UTC)
From:   Ali Mahmood <musamahmood58@gmail.com>
Reply-To: alimahmood67@yahoo.com
Message-ID: <132474112.126958.1566381636337@mail.yahoo.com>
Subject: I NEED YOUR URGENT RESPONSE TO THIS EMAIL.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Friend,

My Name is Mr Ali Mahmood, i have a business transaction. I will be very glad if you can
assist me to receive this sum of ( $22 Million dollars.) into your bank account for the benefit of our both families, reply me if you are interested in this business.

Mr Ali Mahmood
