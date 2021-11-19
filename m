Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAF145715C
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 16:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbhKSPIR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 10:08:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:53544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230209AbhKSPIR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 10:08:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F5FD61351;
        Fri, 19 Nov 2021 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637334315;
        bh=QqPpZLfQSZ3x8aFkAVE7UIvA2Hemo+IaeBEzmEtyIAc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=sPMp5BqCWDeRlsgTuZ1nPv2owvCpzPiwyrondafB4kZDbc59qz5T7JPatkB/IGdrH
         60CO276AbgOOsvtrwOKwB0Ox99TmtL7e00SDt/z83SlOXSWOOa/COLXLhgZhU70rqx
         BaP0BpVKAw1Q3yfH/uzPXY+JRJAbJeLZpvcmfAh5QQtrYX5B8x2hq0010cvrJzouU+
         KipYtjoqHJ3rPWihYt0m1iE/9E/wLNGhlAH8hViqzgI9SlIiWqurAbmLq9BwNjLjYn
         uA3aIiXcRJN/9wGwOEuKmykknnd9CZQAKU7WUJROaCkrwgeXJ6ogtJHDxDBFSk39gi
         mJsAcFUFxWb1Q==
Date:   Fri, 19 Nov 2021 16:05:12 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     benjamin.tissoires@redhat.com, alexhenrie24@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] HID: apple: Do not reset quirks when the Fn key is
 not found
In-Reply-To: <20211118072955.29708-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2111191604530.16505@cbobk.fhfr.pm>
References: <20211118072955.29708-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 18 Nov 2021, José Expósito wrote:

> When a keyboard without a function key is detected, instead of removing
> all quirks, remove only the APPLE_HAS_FN quirk.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

The series is now in hid.git#for-5.17/apple. Thanks,

-- 
Jiri Kosina
SUSE Labs

