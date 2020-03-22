Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 107A018ED32
	for <lists+linux-input@lfdr.de>; Mon, 23 Mar 2020 00:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgCVXKM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Mar 2020 19:10:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:35286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726903AbgCVXKM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Mar 2020 19:10:12 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D94C62072D;
        Sun, 22 Mar 2020 23:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584918611;
        bh=SAFDrEj3QHT7RheZy5jUsNjLDYSp9kv7h4u7UQZ6zkU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=y4pJThdE1gzBzflh69O1yFAkUW5gBKV2h+lJKW5HNglzVyyLT7EIc/dol79jnlDy/
         JUAvhVsoRaQzQFsWOfWRaS6ep11TVH+Ki9h5SghDaBFACQjwfae9UtpFvpvsqxyd7H
         lmKmyVNaiL0nBCdZ0h6HHvSJl7BGnar+ZEjcULHg=
Date:   Mon, 23 Mar 2020 00:10:08 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: rmi: Simplify an error handling path in
 'rmi_hid_read_block()'
In-Reply-To: <20200321064048.15768-1-christophe.jaillet@wanadoo.fr>
Message-ID: <nycvar.YFH.7.76.2003230009590.19500@cbobk.fhfr.pm>
References: <20200321064048.15768-1-christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 21 Mar 2020, Christophe JAILLET wrote:

> The 'RMI_READ_REQUEST_PENDING' bit is already cleared in the error 
> handling path. There is no need to reset it twice.

Good catch. Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

