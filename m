Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADE4082FEA
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 12:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732667AbfHFKob (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 06:44:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:42020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730068AbfHFKoa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Aug 2019 06:44:30 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E63852147A;
        Tue,  6 Aug 2019 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565088270;
        bh=RE4LYqyZC3nxGR4DY/hZXh7lFAak3XTUiykn9X5zQGs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=h5Lfg02p2XPxNt0YbSYS0lK7k3nVNbP8ieel9hR9bGBc6D+7ui2q01OrgfFJYykMc
         YSEvvODgoEX4JOjJgHWsLqPk0Ppi4CUNkn6jGZQMETFDSnXbkGXysbKWmWCuN9ISI+
         47zJX4QYkvtDia6MxBQ0DNF2Ns38uKrNZ+dhGjuE=
Date:   Tue, 6 Aug 2019 12:44:25 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hillf Danton <hdanton@sina.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot <syzbot+62a1e04fd3ec2abf099e@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH resend 1/2] HID: hiddev: avoid opening a disconnected
 device
In-Reply-To: <20190806083858.8032-1-hdanton@sina.com>
Message-ID: <nycvar.YFH.7.76.1908061244150.27147@cbobk.fhfr.pm>
References: <20190806083858.8032-1-hdanton@sina.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Both patches applied, thanks.

-- 
Jiri Kosina
SUSE Labs

