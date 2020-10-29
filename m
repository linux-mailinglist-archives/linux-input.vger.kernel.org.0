Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C85C29F105
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 17:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgJ2QQ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 12:16:26 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:52425 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726398AbgJ2QQ0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 12:16:26 -0400
Received: from [192.168.0.2] (ip5f5af455.dynamic.kabel-deutschland.de [95.90.244.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7E26B20643C72;
        Thu, 29 Oct 2020 17:16:23 +0100 (CET)
To:     linux-input@vger.kernel.org
Cc:     it+linux-input@molgen.mpg.de,
        Mario Limonciello <mario.limonciello@dell.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Dell XPS 13 9310: PNP: DLL0991 PNP0f13 supports
Message-ID: <22fc1c31-3fcc-c029-1fc5-26859a68da0d@molgen.mpg.de>
Date:   Thu, 29 Oct 2020 17:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Linux folks,


On a Dell XPS 13 9310, Linux 5.9.1 from Debian Sid/unstable displays the 
message below.

     [    2.218614] psmouse serio1: synaptics: Your touchpad (PNP: 
DLL0991 PNP0f13) says it can support a different bus. If i2c-hid and 
hid-rmi are not used, you might want to try setting 
psmouse.synaptics_intertouch to 1 and report this to 
linux-input@vger.kernel.org.

I am going to ask the user for a test of 
`psmouse.synaptics_intertouch=1`, so the ID can be added to the force 
list, but until know no Dell DLLXXXX ids show up there.


Kind regards,

Paul
