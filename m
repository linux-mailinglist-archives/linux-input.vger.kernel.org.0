Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39FD719D79C
	for <lists+linux-input@lfdr.de>; Fri,  3 Apr 2020 15:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgDCNbk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Apr 2020 09:31:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727882AbgDCNbk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 Apr 2020 09:31:40 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9281C206B8;
        Fri,  3 Apr 2020 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585920699;
        bh=LoiXa92UbE/cPBpjLDgTmET/rxdChGRWqC3HTUiLCik=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=c7EYbVTxKuQRrm2vld1ZvpOjW1YyQ42p3gcZoTgpTdgeFMN6q6AFLDHnGfTpECuG4
         jDYEUbGYnjBIGsbDsOKLU46/9J+UNbHSWj/mdLepVqojDuC+pN1IsNgqJy+LlFm2Qp
         UQ0c1jHwhaw1kf+DLQqdm6GzQX0InQAJgLxM1hvY=
Date:   Fri, 3 Apr 2020 15:31:36 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: logitech: drop outdated references to unifying
 receivers
In-Reply-To: <20200112235009.4074405-1-lains@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2004031531190.19713@cbobk.fhfr.pm>
References: <20200112235009.4074405-1-lains@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 12 Jan 2020, Filipe Laíns wrote:

> The hid-logitech-{dj,hidpp} were originally developed for unifying
> receivers but since then they have evolved and now support other types
> of receivers and devices. This patch adjusts the original descriptions
> with this in mind.

Benjamin, I guess you are fine with this change ... ?

Thanks,

-- 
Jiri Kosina
SUSE Labs

