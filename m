Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED99E1625AF
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2020 12:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgBRLot (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 06:44:49 -0500
Received: from www149.your-server.de ([78.47.15.70]:44596 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgBRLos (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 06:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9ODcbuBq0KSowtL9HqLEZNLZuVdpriDI3R3nICsV+FY=; b=YrBlPiXeQy59XycF3VGLBZD/jn
        wEyqzN3Tk6w4NdpKdrzXRouQQgZ8I2odZgQ2yhCSHbDCeh+HzUJ/yal61HWtQdDmnG+tI9cOIVTI0
        y84t56B4wvrGs40/J2ZZ5UIxMpDK/1dp5cMhniigep9XTHCovaVkOM5tk0FCKQQXTrPwl1sWU4dGt
        vCdE4f1tNK3ri6DHOTMkcMXdYZoqjOOYP1a9bnPCFWKfjHvBqDfgPfmYSiWio8nxXRYdVFVR5V7g8
        uDTpaZhk2k6+SkUKEtU4q/2U57hxdFd8bbQOK+c8Mr6lI2KnsoaTofTqL2KTOyJzoUZNVc3R5uSkK
        QeXb2F9A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <kontakt@hanno.de>)
        id 1j415R-0002Uw-EP; Tue, 18 Feb 2020 12:30:45 +0100
Received: from [2a04:4540:680e:4300:a894:29ae:bca2:b322]
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <kontakt@hanno.de>)
        id 1j415R-000GFn-B0; Tue, 18 Feb 2020 12:30:45 +0100
Subject: [PATCH v2 0/3] HID: hid-bigbenff: fixing three crash bugs in a
 gamepad driver
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
 <CAO-hwJJ1sc_RAh4ytWSOmRqfVESi2dvB_Ao_Vn+6XXixxVyxrA@mail.gmail.com>
From:   Hanno Zulla <kontakt@hanno.de>
Message-ID: <74d73ebc-0cff-768d-00b7-57bb9b44124f@hanno.de>
Date:   Tue, 18 Feb 2020 12:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJJ1sc_RAh4ytWSOmRqfVESi2dvB_Ao_Vn+6XXixxVyxrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: kontakt@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25726/Mon Feb 17 15:01:07 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

> I think the patches are correct (have you tested them with actual HW?).

Yes, I did, and am also properly embarrassed that I didn't notice the 
double free bug in the original driver.

> However, checkpatch complains that the From and Signed-off-by email
> differ. Can you send a v2 with a fix for that?

Here it is.

Thanks,

Hanno
