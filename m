Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5275F2CD64
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 19:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfE1ROr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 13:14:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:33880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbfE1ROr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 13:14:47 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 785482075B;
        Tue, 28 May 2019 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559063686;
        bh=eq+BlEZ0qAIb4yf8KsxFga7Y9a2W40b/aqxSio8a4Fs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=aL9dLgtwSPrbtObX+svakqDt3yIvQc7zJhPGU82RtS4niBDSjAu7HFBToHFGyKqE0
         zKyIO8HF00i21ozO0JtKWF6o3cDEchz+6dJC4O6T+8hg6hksH/kb+P2euwwf+8QDV6
         erqu8NAb8UAXsw0GoEUMnTd+ZtfBibSm9pcVX91g=
Date:   Tue, 28 May 2019 19:14:43 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dave Hansen <dave.hansen@intel.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: hid-related 5.2-rc1 boot hang
In-Reply-To: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com>
Message-ID: <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm>
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 28 May 2019, Dave Hansen wrote:

> I have a system that works fine on 5.1.  When updating to 5.2-rc1, it
> hangs at boot waiting on an instance of systemd-udevd.  The kernel
> backtrace (https://photos.app.goo.gl/EV8rf7FofWouvdeE8) looks like it's
> doing an finit_module() that dives into the hid code and is waiting on a
> request_module().

Dave,

thanks for the report.

Just to confirm -- I guess reverting 4ceabaf79 and a025a18fe would work 
this around, right?

-- 
Jiri Kosina
SUSE Labs

