Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F13314BAA
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 10:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhBIJad (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 04:30:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:52430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229981AbhBIJ22 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Feb 2021 04:28:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECE2164E26;
        Tue,  9 Feb 2021 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612862868;
        bh=5sfDL0nQFDumSda8/jOvRYwCgWHbyu8kZmDo58u1ONs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=I3OEjoPQ1nwluox08V3dl8/1Ql4tOmTad9N6twxUdvROnjtNMfiEP49nH0Xo1aKU7
         ZxHVopWsT5Ti5KsTvk08U3xd/ta0QfiHwNB2h6zESclYfgEvLsmWz46cYQSPVfrvlZ
         K2sk+ojl2afE9Wd0d2qgp9/XPVHkig3waMkR57sXZyo3eN9WNBy+91HcIp5qak8IuE
         ZosFzkG1mygIyThjjlLxImuWTEiyFkX0u1xScu+5NPAIsTpZQzczrvRxMiEC1SZu8C
         0teLOPDKkRJYwCXkmIuJfSmnIJ/VI4gIWIBsbyQCPRxFHv78VKS3czf+Y9+k/exmCc
         lJMq+gDyJr7ow==
Date:   Tue, 9 Feb 2021 10:27:44 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc:     You-Sheng Yang <vicamo.yang@canonical.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Tiger Lake H PCI device
 ID
In-Reply-To: <37cf77123be66e14f517a59576cdaba9c5787d0d.camel@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2102091027350.28696@cbobk.fhfr.pm>
References: <20210204083315.122952-1-vicamo.yang@canonical.com> <37cf77123be66e14f517a59576cdaba9c5787d0d.camel@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 8 Feb 2021, Srinivas Pandruvada wrote:

> > Added Tiger Lake H PCI device ID to the supported device list.
> > 
> > Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

