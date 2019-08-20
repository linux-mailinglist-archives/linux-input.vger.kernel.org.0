Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706A39636A
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 16:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfHTO7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 10:59:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:47814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730277AbfHTO6j (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 10:58:39 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D14C922DA9;
        Tue, 20 Aug 2019 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566313119;
        bh=vdmmmwS+x0NcUAnfqZFzhfPdflObUDN6RHnWgeQIDBs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=IYkdbknPe8C+AFrwwrcxUXsdzZ9Q0vdKsb+WF6iF4GSZK8MTyjH5Gm8IAPy9FuaTj
         +Oengge2+NkpbvwYtQBpZnUYZCQ7/cQtGHiD/OTK/fr9l4+AeGM+b6T8AIWc4C+p6x
         KWcnndGIoWzJ4ifBA7ra0z6JFiizWh4vMiZINOzk=
Date:   Tue, 20 Aug 2019 16:58:28 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jason Gerecke <killertofu@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: Re: [PATCH] HID: wacom: Fix several minor compiler warnings
In-Reply-To: <20190816185426.25137-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.1908201658150.27147@cbobk.fhfr.pm>
References: <20190816185426.25137-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 16 Aug 2019, Jason Gerecke wrote:

> Addresses a few issues that were noticed when compiling with non-default
> warnings enabled. The trimmed-down warnings in the order they are fixed
> below are:
> 
> * declaration of 'size' shadows a parameter
> 
> * '%s' directive output may be truncated writing up to 5 bytes into a
>   region of size between 1 and 64
> 
> * pointer targets in initialization of 'char *' from 'unsigned char *'
>   differ in signedness
> 
> * left shift of negative value
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Reviewed-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>

Applied to for-5.4/wacom.

-- 
Jiri Kosina
SUSE Labs

