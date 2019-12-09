Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74295116D5B
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 13:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfLIMzW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 07:55:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727268AbfLIMzW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 07:55:22 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D924A2077B;
        Mon,  9 Dec 2019 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575896121;
        bh=gp/gNgB7h/mpdzcvYi+fzXI19RjVObL4bP1I20SNXCY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=VoUMTwN43lMzgorJ1b6eEnJz0CtmKr04ajb7WrK0918FIhcWVdJGloF8vDFaI5RUu
         Odvuf4INFBf3Yvhqc7PjVCpyT0Pi3iZARU8A2TJ0oyDTMMVoWmAXCH8kJT493aNlAx
         AJITNOgoaOvnqXG+tzvOW9u272OV7dNttqduVSTQ=
Date:   Mon, 9 Dec 2019 13:55:18 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Aaron Ma <aaron.ma@canonical.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: Add LG MELF0410 I2C touchscreen
 support
In-Reply-To: <20191204124207.5369-1-aaron.ma@canonical.com>
Message-ID: <nycvar.YFH.7.76.1912091355070.4603@cbobk.fhfr.pm>
References: <20191204124207.5369-1-aaron.ma@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 4 Dec 2019, Aaron Ma wrote:

> Add multitouch support for LG MELF I2C touchscreen.
> Apply the same workaround as LG USB touchscreen.

Applied, thank you Aaron.

-- 
Jiri Kosina
SUSE Labs

