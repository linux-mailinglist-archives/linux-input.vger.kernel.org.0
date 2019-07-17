Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B17216BB59
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 13:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfGQLai (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 07:30:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:33856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfGQLai (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 07:30:38 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E5E520880;
        Wed, 17 Jul 2019 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563363037;
        bh=kYrTFywVNEOcsqT9h3RDsiGtTWLaNmgHCsJqpgxej5M=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=CacGiyKcDt0dGbSHJjdPxPxPksfAy0UogtH9e3Z6DTpc26ccLB82v38aUtOCON1Kd
         WlEyKKx9239zGlHPH/QS+0sC9LOWMgnjEQT3B/hYlyz5ncsJUsCIruQt/Pl+Ln7hz2
         aj+8cOOvTL5Z0uwVfj2BqFYsMgDNITvsx/1kuNiY=
Date:   Wed, 17 Jul 2019 13:30:27 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     nlopezcasad@logitech.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid-logitech-dj: rename "gaming" receiver to
 "lightspeed"
In-Reply-To: <20190716073621.4290-1-lains@archlinux.org>
Message-ID: <nycvar.YFH.7.76.1907171330190.5899@cbobk.fhfr.pm>
References: <20190716073621.4290-1-lains@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Applied, thans.

-- 
Jiri Kosina
SUSE Labs

