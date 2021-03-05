Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678A632DF0C
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 02:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhCEBYL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 20:24:11 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:24208 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhCEBYK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Mar 2021 20:24:10 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="39657531"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 05 Mar 2021 09:24:08 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2828:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 05 Mar 2021 09:24:05 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2474:1:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 05 Mar 2021 09:24:05 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     "'linux-kernel'" <linux-kernel@vger.kernel.org>,
        "'linux-input'" <linux-input@vger.kernel.org>,
        "'phoenix'" <phoenix@emc.com.tw>,
        "'dave.wang'" <dave.wang@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw> <YDx8M4Rhdi8hW4EO@google.com> <1614647097.9201.jingle.wu@emc.com.tw> <YEGBeWHRfL4gN9pX@google.com>
In-Reply-To: <YEGBeWHRfL4gN9pX@google.com>
Subject: RE: [PATCH] Input: elan_i2c - Reduce the resume time for new dev ices
Date:   Fri, 5 Mar 2021 09:24:05 +0800
Message-ID: <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQGs01cKeSW+WSlGkCw6sJc3Mb/pawH5MxoQAdwxvXACK2QSBKqZDPmQ
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy03OTJkN2ViZS03ZDUxLTExZWItOGUwZi1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcNzkyZDdlYzAtN2Q1MS0xMWViLThlMGYtZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSIxNjgwIiB0PSIxMzI1OTM4MTA0NTM5MzU3NzQiIGg9ImlvQnd0Wnp3K3BFWTdYWDBiaTc1YkdJSVQycz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI Dmitry:

In this case (in the newer parts behavior regarding need to reset after
powering them on), it is consistent with the original driver behavior with
any new or old device
(be called data->ops->initialize(client) : usleep(100) , etc.. , because
this times "data->quirks" is equal 0 at probe state.) 

THANKS
JINGLE

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Friday, March 05, 2021 8:55 AM
To: jingle.wu
Cc: linux-kernel; linux-input; phoenix; dave.wang; josh.chen
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev
ices

Hi Jingle,

On Tue, Mar 02, 2021 at 09:04:57AM +0800, jingle.wu wrote:
> HI Dmitry:
> 
> So data->ops->initialize(client) essentially performs reset of the 
> controller (we may want to rename it even) and as far as I understand 
> you would want to avoid resetting the controller on newer devices, 
> right?
> 
> -> YES
> 
> My question is how behavior of older devices differ from the new ones 
> (are they stay in "undefined" state at power up) and whether it is 
> possible to determine if controller is in operating mode. For example, 
> what would happen on older devices if we call elan_query_product() 
> below without resetting the controller?
> 
> -> But there may be other problems, because ELAN can't test all the 
> -> older devices , so use quirk to divide this part.

OK, but could you please tell me what exactly was changed in the newer parts
behavior regarding need to reset after powering them on?

Thanks.

--
Dmitry

