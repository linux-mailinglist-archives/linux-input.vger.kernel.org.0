Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01D131A3D71
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 02:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgDJArQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 20:47:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:40254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726859AbgDJArQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 20:47:16 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06AED20768;
        Fri, 10 Apr 2020 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586479636;
        bh=wJYs6lkSvNsuhACwK5W8u2c2QF4FqGBMCSr375KwCG4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=B1U0KbGI0cvJP+BKZ7ebNhuWSgk01kTViaKevH/IPT9PrgKRaPeqUeJ8L256zbdrC
         vqPMSXYsoxd7brYWpj4HBDvsW3FAASWelvTP+7bsDtUuFywM/5jozVZg3oSEKVSs8A
         bcmTuvRsT73JAjrefHYYWoEo3tKGD/ZAFyO+OtFY=
Date:   Fri, 10 Apr 2020 02:47:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Masaki Ota <masaki.ota@alpsalpine.com>
cc:     Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        Artem Borisov <dedsa2002@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
In-Reply-To: <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
Message-ID: <nycvar.YFH.7.76.2004100245260.19713@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm> <20200409230009.22551-1-dedsa2002@gmail.com> <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 10 Apr 2020, Masaki Ota wrote:

> Hi, Cao-san,
> 
> Do you know AUI1657 device? This device looks U1. I think recent all U1 
> devices work as PTP. Linux also supports PTP, so I think we should add 
> something ID to Linux source code. (I remember a something flag is 
> already exist.)

That's actually partially covered by Artem's 1/1 patch you have not been 
CCed on -- please see it here:

	http://lore.kernel.org/r/20200405235517.18203-1-dedsa2002@gmail.com

If this could be made more generic to cover a group of devices all-in-one, 
that'd be even better of course.

Thanks,

-- 
Jiri Kosina
SUSE Labs

