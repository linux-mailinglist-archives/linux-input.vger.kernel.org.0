Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A9C181664
	for <lists+linux-input@lfdr.de>; Wed, 11 Mar 2020 12:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgCKLA3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Mar 2020 07:00:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbgCKLA3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Mar 2020 07:00:29 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC0582146E;
        Wed, 11 Mar 2020 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583924428;
        bh=zWJX878F5JTlG9BrGjZKPgqPw6kJHLqTOcUTp0CLp2g=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XJb0zb2SQKBNYBrlyCvymPUpv7rjifXJa6jTN2u40VtAy4ol6hCjTHlA9V28YY3gf
         yzscfIdzAX/21uMSH/JfMVoL7hyQUoVuj0mBP2DLhvEI79pkFLlYqeq2hLZ5nBH0/J
         eYcvPj07mkBgnJBsXzcQTB27chekJdVThEw5dqCk=
Date:   Wed, 11 Mar 2020 12:00:25 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
cc:     =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: hid-picolcd_fb: Use scnprintf() for avoiding
 potential buffer overflow
In-Reply-To: <20200311073719.7173-1-tiwai@suse.de>
Message-ID: <nycvar.YFH.7.76.2003111200140.19500@cbobk.fhfr.pm>
References: <20200311073719.7173-1-tiwai@suse.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 11 Mar 2020, Takashi Iwai wrote:

> Since snprintf() returns the would-be-output size instead of the
> actual output size, the succeeding calls may go beyond the given
> buffer limit.  Fix it by replacing with scnprintf().
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied to for-5.6/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

