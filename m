Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623733FB9CA
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 18:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237971AbhH3QIi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 12:08:38 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46473 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237682AbhH3QIh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 12:08:37 -0400
Received: (qmail 336933 invoked by uid 1000); 30 Aug 2021 12:07:43 -0400
Date:   Mon, 30 Aug 2021 12:07:43 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     Michal Kubecek <mkubecek@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue
 full" since v5.14-rc1
Message-ID: <20210830160743.GB332514@rowland.harvard.edu>
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
 <20210816143856.GA121345@rowland.harvard.edu>
 <20210816191249.7g2mk5thwpio7cfc@lion.mk-sys.cz>
 <1954573.0n35tlyJVE@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1954573.0n35tlyJVE@natalenko.name>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 30, 2021 at 05:48:09PM +0200, Oleksandr Natalenko wrote:
> Hello.
...
> Any luck with moving this forward please? I've got a similar issue with APC 
> UPS and v5.14 kernel, and this patch also solves the connectivity issue for 
> me.

I've been waiting to hear back from Benjamin to see if testing revealed 
any problems with the latest version of the patch.

Alan Stern
