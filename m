Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6C19194B
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2019 21:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfHRThC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Aug 2019 15:37:02 -0400
Received: from mail.skyhub.de ([5.9.137.197]:54656 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfHRThC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Aug 2019 15:37:02 -0400
Received: from zn.tnic (p200300EC2F259C009DE1F825CAC07DED.dip0.t-ipconnect.de [IPv6:2003:ec:2f25:9c00:9de1:f825:cac0:7ded])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F63F1EC0682;
        Sun, 18 Aug 2019 21:37:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1566157020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TBGJ/bm31ctHahHHgkIJ75Dakb8+noJAqut4gxtY15g=;
        b=qpezTeVoohh8hAds5lug0Ux2VUAtOCmGMSYFSIyIueMf2ihzSjcixi7ZfMunjuWgVtRshR
        LRD4sKZ+gZL8df2TRdups7v07iRLuIF4cgrQqABlnuJHC8qnq0N/QpsJp4KmSD8svcZnyT
        syoMDpEcbKQaIAHqwOs79MpvD4epXe8=
Date:   Sun, 18 Aug 2019 21:37:45 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Cc:     linux-kernel@vger.kernel.org, pv-drivers@vmware.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/4] Add support for updated vmware hypercall instruction
Message-ID: <20190818193744.GB29353@zn.tnic>
References: <20190818143316.4906-1-thomas_os@shipmail.org>
 <20190818180929.GA29353@zn.tnic>
 <c0f32d6b-3b6a-f931-071f-9fb308efba00@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0f32d6b-3b6a-f931-071f-9fb308efba00@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Aug 18, 2019 at 09:02:04PM +0200, Thomas Hellström (VMware) wrote:
> I was trying to be clever and avoid spamming people with stuff they might
> not care about.

Sure but if, for example, you're adding VMWARE_HYPERCALL in patch 2 and
the users are in the following patches, it would be helpful if I could
see them too. That is one good reason to CC everybody with the whole
patchset.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
