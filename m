Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48D2225CB3
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 12:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgGTKgV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 06:36:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbgGTKgV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 06:36:21 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02C6A22482;
        Mon, 20 Jul 2020 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595241380;
        bh=Hd1QF9zvCVI5iXgm8BztRtIEgEQg64uDO9bxt+/+Gsk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=WXrP9jg+Np9qxIo4n+1i1KfH/1+gf6wh2XqIc8wQ3X4LECnYQ22XrJFCpskVIHnfl
         3mm41RrsZdM0jjg4YpL3k2j3e7nm3OU4pBs1JQRKi1EhwNsSTAm8dvraQDJP4Nuo6X
         cjDUBy2xpBM8CvzEW6XN71jlsnltdLvGb4BCUk7I=
Date:   Mon, 20 Jul 2020 12:36:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Replace HTTP links with HTTPS ones
In-Reply-To: <20200718114749.19561-1-grandmaster@al2klimov.de>
Message-ID: <nycvar.YFH.7.76.2007201236100.23768@cbobk.fhfr.pm>
References: <20200718114749.19561-1-grandmaster@al2klimov.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

