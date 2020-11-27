Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE712C6837
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 15:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730957AbgK0Oun (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 09:50:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:34384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730935AbgK0Oun (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 09:50:43 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AAF0221EB;
        Fri, 27 Nov 2020 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606488642;
        bh=SqwkfWzTNnQQCwlRXK/BH4vTy85g339B51XDPUrpvL4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KC0PTcamUlxyFCrGUCrCaStWXSqoQub7m8wY8i99gjrKYtBMTIwHLgbVOQ5d+T7jS
         ceITRcewrCJRk7ybV55CwXYwIO6vTlaPVHxRGyPKF3xRsHeDOEFYi0RLIPzm2aLMj7
         av5PNgZ6fBIwjWM6x9UufyWkHjEh7WO4i1xE8MN0=
Date:   Fri, 27 Nov 2020 15:50:39 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pascal Giard <pascal.giard@etsmtl.ca>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanjay Govind <sanjay.govind9@gmail.com>
Subject: Re: [PATCH v3] HID: sony: support for ghlive ps3/wii u dongles
In-Reply-To: <20201126030230.304940-1-pascal.giard@etsmtl.ca>
Message-ID: <nycvar.YFH.7.76.2011271550230.3441@cbobk.fhfr.pm>
References: <20201108013818.12214-1-pascal.giard@etsmtl.ca> <20201126030230.304940-1-pascal.giard@etsmtl.ca>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 25 Nov 2020, Pascal Giard wrote:

> This commit adds support for the Guitar Hero Live PS3 and Wii U dongles.

Applied, thanks Pascal.

-- 
Jiri Kosina
SUSE Labs

