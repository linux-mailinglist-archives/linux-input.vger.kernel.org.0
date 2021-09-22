Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4A4414584
	for <lists+linux-input@lfdr.de>; Wed, 22 Sep 2021 11:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbhIVJvM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Sep 2021 05:51:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:58044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234387AbhIVJvL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Sep 2021 05:51:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14E5E61100;
        Wed, 22 Sep 2021 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632304182;
        bh=Y9nyxD23K4UWWJ9TH6Baf+2B9amSBcsz/ckByzRoFu0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=T7CYWsB0HBUPPtu9Fqvkffkvj5QXBzriuunJdnteLJo8WaZMcumDT/jEtrJz20P7Z
         ZtqP9kaGUWfI5nEN/Godb8w0lSW7bSKx/kop2Sb8RXVPMbp8sR94CqDRfQCsUzpYWF
         k++ERvlrQ2UOI3hKuP6RGYYjcaLazLeDSMYMBNI3sHCC0rniibu6fpWc1t41j5GtCy
         uBRR8qe2c/AXnjyZ+H8S5aYHVXsRFzvJizRW9HTz2v3BGEfx92hu05iIW4t2rd+dTy
         eyyrIiqG7nY4msjJLWY4wrNC9K37vxM0NiysqDf9CXP7F9mK36hMa3HRvPkmOhTgBv
         /95yrJSgXAHLw==
Date:   Wed, 22 Sep 2021 11:49:39 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: hid-debug: clean up snprintf() checks in
 hid_resolv_usage()
In-Reply-To: <20210916132154.GC25094@kili>
Message-ID: <nycvar.YFH.7.76.2109221149310.15944@cbobk.fhfr.pm>
References: <20210916132154.GC25094@kili>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 16 Sep 2021, Dan Carpenter wrote:

> The snprintf() limits are complicated and slightly wrong when it does:
> 
> 	max(0, HID_DEBUG_BUFSIZE - len - 1)
> 
> The "- 1" should not be there.  It means we can't use the last
> byte of the buffer.  If we change the first snprintf() to scnprintf()
> then we can remove the max().
> 
> At the start of the function the strlen(buf) is going always going to
> be < HID_DEBUG_BUFSIZE so that is safe.  If it were > HID_DEBUG_BUFSIZE
> then that would result in a WARN().

Applied, thanks Dan.

-- 
Jiri Kosina
SUSE Labs

