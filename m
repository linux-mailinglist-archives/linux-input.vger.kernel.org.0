Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F251E1B94
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 08:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgEZGxV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 02:53:21 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:62936 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgEZGxU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 02:53:20 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="35739055"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 26 May 2020 14:53:18 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(20967:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 26 May 2020 14:53:18 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2484:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 26 May 2020 14:53:16 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <phoenix@emc.com.tw>, <dave.wang@emc.com.tw>,
        <josh.chen@emc.com.tw>
References: <20200526022246.4542-1-jingle.wu@emc.com.tw> <20200526041719.GH89269@dtor-ws>
In-Reply-To: <20200526041719.GH89269@dtor-ws>
Subject: RE: [PATCH] Input: elantech - Remove read/write registers in attr.
Date:   Tue, 26 May 2020 14:53:15 +0800
Message-ID: <001701d6332a$54ebc970$fec35c50$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
thread-index: AQJkLPP72s3DFgLZomzEGNYQSBUd1gGlmuz5p5DNyNA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy05MjgyY2JmMi05ZjFkLTExZWEtODRlNy1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcOTI4MmNiZjQtOWYxZC0xMWVhLTg0ZTctZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSI4MzkiIHQ9IjEzMjM0OTQ5NTk1OTI5MDgzNCIgaD0ib3RDQzJqWjlMUTZzMGFZWHQ1Q2ZNVkdvdGVFPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI Dmitry:

These changes would not affect all the behavior of the old IC, including all
the TP functions

THANKS
JINGLE

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Tuesday, May 26, 2020 12:17 PM
To: Jingle.Wu
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org;
phoenix@emc.com.tw; dave.wang@emc.com.tw; josh.chen@emc.com.tw
Subject: Re: [PATCH] Input: elantech - Remove read/write registers in attr.

Hi Jingle,

On Tue, May 26, 2020 at 10:22:46AM +0800, Jingle.Wu wrote:
> New Elan IC would not be accessed with the specific regiters.

What about older Elaan parts? We can't simply drop compatibility with older
chips in newer kernels.

Thanks.

--
Dmitry

