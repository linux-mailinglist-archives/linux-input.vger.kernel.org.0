Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE7640C828
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 17:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbhIOPWS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Sep 2021 11:22:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:35186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233977AbhIOPWS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Sep 2021 11:22:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FC7161186;
        Wed, 15 Sep 2021 15:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631719259;
        bh=P5Vd+pOYkKQQ5c+sHVTU3pN0YcLpeKA0NDzRcn5GjtU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=qwSNSo8mxI3ZQEAyCfsCX0ShPf0LJBj2JiSv0SGvIbCoQ8l0u58oewgB5L2+h7VLf
         v2YEKqwK0URiRedXI0L/U7k6Adzm+yC0sghfePrI9i5htt/rQkUW3H7bPnbR122DA8
         QZVpEBxRiet7l22rhR2/VNRVr20hXJhV6QxDynQY7J7F1rGfgNhg/klBt3JvlEKI1g
         hRR9nOw1Yx7mkAxjeiycoU3ZrJ3FA5NNzlrslpZWW6iIgQops+7mdkWyBwvCGOf1cM
         kTBPago9s9dmebwPnWSd5IL0pPNFSzWILCSHohrvj19vNA3dFSHQBnPNIW1w2gfbL9
         HocUCLmzsnebQ==
Date:   Wed, 15 Sep 2021 17:20:56 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Cheng, Ping" <Ping.Cheng@wacom.com>
cc:     Joshua Dickens <joshua@joshua-dickens.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "Dickens, Joshua" <joshua.dickens@wacom.com>,
        "Gerecke, Jason" <Jason.Gerecke@wacom.com>
Subject: RE: [PATCH] HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL)
 support Added the new PID's to wacom_wac.c to support the new models in the
 Intuos series
In-Reply-To: <DB6PR07MB42785C8760C865631AC17DAF9BDB9@DB6PR07MB4278.eurprd07.prod.outlook.com>
Message-ID: <nycvar.YFH.7.76.2109151720410.15944@cbobk.fhfr.pm>
References: <20210914172825.63335-1-Joshua@Joshua-Dickens.com> <nycvar.YFH.7.76.2109151651440.15944@cbobk.fhfr.pm> <DB6PR07MB42785C8760C865631AC17DAF9BDB9@DB6PR07MB4278.eurprd07.prod.outlook.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 15 Sep 2021, Cheng, Ping wrote:

> Hi Jiri,
> 
> Thank you for your comments and for fixing the Subject line. I am sure 
> Josh will learn from your fix ;). With that said, the patch is:
> 
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>

Thanks to both of you. Now applied.

-- 
Jiri Kosina
SUSE Labs

