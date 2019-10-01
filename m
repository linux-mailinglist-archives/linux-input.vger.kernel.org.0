Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00255C372A
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 16:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfJAOYN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 10:24:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387581AbfJAOYN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Oct 2019 10:24:13 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9199E21855;
        Tue,  1 Oct 2019 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569939852;
        bh=DtYd54/3IZfCY7nrpXq9zBTqzYtKRdKNAPE+LjcOMpA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Srl7mAAYyU0K2eMjXKz7iFef2gX+7zh9HwRww3J2Nty1Z5K1Kdbgz1NgQh3UcG1Z0
         U8v9spZpVE7yuwcdKpKwgx2QSiPNrOusNJM98cvywSD5I0x13zHTB9gviogMaO779s
         zAr3n1ajP7bTLptEsfT5Q1ncxbE22cjHbaKKxLQE=
Date:   Tue, 1 Oct 2019 16:23:46 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rishi Gupta <gupt21@gmail.com>
cc:     dmitry.torokhov@gmail.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: hidraw: replace printk() with corresponding
 pr_xx() variant
In-Reply-To: <1568946901-29752-1-git-send-email-gupt21@gmail.com>
Message-ID: <nycvar.YFH.7.76.1910011623370.13160@cbobk.fhfr.pm>
References: <20190919161613.GR237523@dtor-ws> <1568946901-29752-1-git-send-email-gupt21@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 20 Sep 2019, Rishi Gupta wrote:

> This commit replaces direct invocations of printk with
> their appropriate pr_info/warn() variant.
> 
> Signed-off-by: Rishi Gupta <gupt21@gmail.com>
> ---
> Changes in v3:
> * Use hid_warn() subsystem specific variant instead of pr_warn()

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

