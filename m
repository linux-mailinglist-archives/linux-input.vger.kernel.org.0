Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488BF134584
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 16:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgAHPAt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 8 Jan 2020 10:00:49 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:30737 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbgAHPAt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jan 2020 10:00:49 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="34122421"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 08 Jan 2020 23:00:45 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2832:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Wed, 08 Jan 2020 23:00:43 +0800 (CST)
Received: from 39.10.5.22
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2479:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Wed, 08 Jan 2020 23:00:41 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Dmitry Osipenko'" <digetx@gmail.com>,
        "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        =?utf-8?Q?'Micha=C5=82_Miros=C5=82aw'?= <mirq-linux@rere.qmqm.pl>
Cc:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "'Scott Liu'" <scott.liu@emc.com.tw>,
        "'James Chen'" <james.chen@emc.com.tw>,
        <linux-kernel@vger.kernel.org>,
        "'Henrik Rydberg'" <rydberg@bitmath.org>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        "'Rob Herring'" <robh-dt@kernel.org>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl> <20191212192420.GD101194@dtor-ws> <7c67b849-369f-8a20-4f9e-9e0a7caec1cb@gmail.com>
In-Reply-To: <7c67b849-369f-8a20-4f9e-9e0a7caec1cb@gmail.com>
Subject: RE: [PATCH v2 0/9] input: elants: Support Asus TF300T touchscreen
Date:   Wed, 8 Jan 2020 23:00:33 +0800
Message-ID: <000001d5c634$655bed20$3013c760$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQG/wbboUgEFdZ2Q4eX8SCV758q1EAKWfXCAAgu9J8mn59GaYA==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy00YjEyMDg4NC0zMjI3LTExZWEtODM0MS03YzVjZjg3NDk0NzhcYW1lLXRlc3RcNGIxMjA4ODYtMzIyNy0xMWVhLTgzNDEtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSI3MDMiIHQ9IjEzMjIyOTY5MDk0Mjk2MzgxMiIgaD0iU0RWQzJ5V3lBTldGRWdEVzgvaUpjQ0RGdG5BPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> 12.12.2019 22:24, Dmitry Torokhov пишет:
> > On Wed, Dec 11, 2019 at 05:03:18PM +0100, Michał Mirosław wrote:
> >> This series cleans up the driver a bit and implements changes needed
> >> to support EKTF3624-based touchscreen used in eg. Asus TF300T tablet.
> >
> > Johnny, could you please take a look at this patch series?
> >
> > Thanks!
> 
> Hello Johnny,
> 
> Could you please let us know whether you or anyone else from Elan are going
> to take a look at this patchset anytime soon?

Hi Dmitry Osipenko,

I'm sorry to reply late. James Chen will take a look at this patch set. 

