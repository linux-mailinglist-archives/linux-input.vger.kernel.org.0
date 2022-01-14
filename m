Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477E848EA74
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 14:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbiANNQl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 08:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiANNQl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 08:16:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CAFC061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 05:16:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C99161F50
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 13:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBE8C36AEA;
        Fri, 14 Jan 2022 13:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642166199;
        bh=tUx8p/d2dhT38qHkJZBYDphlKjx2/VTIpgQxWySO7Ww=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=gn8Vckeu1w0vd7kGWvXIJ9kNpJ40J7VeH8eElnYaDTsi06cyCX7AcpnK2nKEOtvn7
         QQJ7j8OY2b7WZ8iH3D4o0pFpk1BdFXpItN0m8gkYnC1bk383p0XJNT5lVFIpWYch+y
         L5P9qqPq1hlSqckMrVlgU/bICkWwoOpSNmIiyk0Z4Tjs/U3H4aIBKKanAwM95OsBKd
         3yRImw0rO39HT37+f2pyMctK+0fKAFuUpP/c8Cq4WEhZQCJPzPji61jIBEZe6vngvY
         gqXN6ECxlFkIRr/Sld+4fhgCbclnzpUokD1FHOpgjJP+bXAn181etE+/rIiP164EFK
         vS1o4fDQAaFCw==
Date:   Fri, 14 Jan 2022 14:16:36 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jelle van der Waa <jelle@vdwaa.nl>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jelle van der Waa <jvanderwaa@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Add driver for Razer Blackwidow keyboards
In-Reply-To: <20211231112500.8350-1-jvanderwaa@redhat.com>
Message-ID: <nycvar.YFH.7.76.2201141412480.28059@cbobk.fhfr.pm>
References: <20211231112500.8350-1-jvanderwaa@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 31 Dec 2021, Jelle van der Waa wrote:

> Add a driver to enable the macro keys (M1 - M5) by default, these are
> mapped to XF86Tools and XF86Launch5 - XF86Launch8. The driver remaps
> them by default to macro keys with an option to retain the old mapping
> which users most likely already use as there are many scripts to enable
> the macro keys available on Github and other websites.
> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>

Thanks for the patch.

In order to follow the usual HID driver naming convention, could you 
please name the driver according to the vendor hid-razer, with the outlook 
of extending in further with more devices from the same vendor, as needed?

Thanks,

-- 
Jiri Kosina
SUSE Labs

