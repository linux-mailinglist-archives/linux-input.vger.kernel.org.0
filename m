Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5275C2B085F
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 16:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgKLP10 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 10:27:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:47134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727932AbgKLP1Z (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 10:27:25 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF97922248;
        Thu, 12 Nov 2020 15:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605194845;
        bh=KXMqFKActDUukVWA32+31xUPWeWnRqtfN6zbxzHPsXk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rY0Qw6PpPBQzOurcEedRcmRR8Mcji6wqHIf6R3eOqZLb9fijc05dTp+YqX/l+2Exb
         vKqcw+8p5gwIawwIHA3uBjuu1IAZXjzPWWH1/d1h+VzbzWlJjVOn8ABkKrTyDelzH8
         auYNyNBogKu9PpjUX6wKpXxMOt3tbQFyqSXKOBNs=
Date:   Thu, 12 Nov 2020 16:27:11 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] SFH: fix error return check for -ERESTARTSYS
In-Reply-To: <20201030143002.535531-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.2011121626590.6877@cbobk.fhfr.pm>
References: <20201030143002.535531-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 30 Oct 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for the error return code -ERESTARTSYS is dead code
> and never executed because a previous check for ret < 0 is catching this
> and returning -ETIMEDOUT instead.  Fix this by checking for -ERESTARTSYS
> before the more generic negative error code.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

