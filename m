Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1896452E73
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 10:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhKPJ4P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 04:56:15 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39928
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232702AbhKPJ4O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 04:56:14 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 593C040014
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637056391;
        bh=4WIA2kLiytpvAuYSWnoOkPVEtpZ6YL0jK44pquUKn9U=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=JTxEm5fIbE/+LyHQkcCx03KZ7Y9ya3fxFLgPpIkmRVUMFRJ4NRoHCFBKVjYyk3QwM
         JK8j2dSFXbppx3mCKESG9uLkxXJLpwzBBFblpWWh0ZFoaDGxofCLqp+DZ4/V1ZP78G
         AZr1iI8Usacqr8mOkfjveC69LuD2SDy8xfOapEfW0zcZSKCxR6A243j0TzHLuKYJB4
         eWF5F8PlgdyxVlGr+qGWiqdOd+A0ZJYorzMrwEU9ouC/OvtVf1xCgqZNLyIGEHbq1n
         +Pe/SOqTxLM+vDTZ4r/ow0OeEK7CSl5k71MOFA92zIfLLfjEPY9j1lMOAjyBRFszur
         xTXnt2Hr07Gbg==
Received: by mail-ed1-f71.google.com with SMTP id a3-20020a05640213c300b003e7d12bb925so4254154edx.9
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 01:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4WIA2kLiytpvAuYSWnoOkPVEtpZ6YL0jK44pquUKn9U=;
        b=PwuVj94SECD34KneB1LTCqmriFF1LgcfsJH4Bud16U4XulFclEp3W80LDVf4g2rcXY
         k9KrQwlEiP/M5HT4J3Vg6qcMTOigz9cjE2oDXUOrfNbiWiG9Wr1J7zFRNNV/xX53+2z0
         J/QyDrtVqCJ+OEk0YGPg+nXNc+lz+EHGF2kbOTi8KOoUz0wk00XqtdP3JX+HTN3I0Isc
         KDtCRI4HDD/+YCrb+qEE6NvmQ3EnXJE3A9Nqk1HQ4idSUcDUbKMn8Z25dMpwJbWlUcjv
         VihNd2w6ROTadK+jAqpCaK2vn0CdWYjvYp0wOuMWChmcVhkrWjjKWNJIjsM8wfHUgg2E
         aPNg==
X-Gm-Message-State: AOAM532ZrOcZXWJmeatGa+nRRcOAiY2XQjHESLA35Sm0bEkx2SqXM14l
        /73WCODBZ9//HPcOrFark03KkcwlX6Msyp5S0K+Kvd7eMdZuKPwZR7NKUbsLlTKwLxlIUpVp4vN
        MeUWABpl9cEpqXvZrKmIRSLYA3BQo6+HtgjisCZ0C
X-Received: by 2002:a17:907:9056:: with SMTP id az22mr8012877ejc.107.1637056391037;
        Tue, 16 Nov 2021 01:53:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrJT7mP/4j4szg3ywz8prXacs4YZ5ZqVekOM7AHJOO0O7H4hGmwILwNBcGPVNTpuNL27qf+A==
X-Received: by 2002:a17:907:9056:: with SMTP id az22mr8012841ejc.107.1637056390838;
        Tue, 16 Nov 2021 01:53:10 -0800 (PST)
Received: from localhost ([2001:67c:1560:8007::aac:c1b6])
        by smtp.gmail.com with ESMTPSA id hd15sm8280157ejc.69.2021.11.16.01.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 01:53:10 -0800 (PST)
Date:   Tue, 16 Nov 2021 10:53:09 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Phoenix Huang <phoenix@emc.com.tw>, jingle.wu@emc.com.tw,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] Input: elantech - Fix stack out of bound access
 in elantech_change_report_id()
Message-ID: <YZN/hXipFP7Ipb7G@arighi-desktop>
References: <20211116072223.8746-1-andrea.righi@canonical.com>
 <YZNsoj7Onbxr68OQ@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZNsoj7Onbxr68OQ@ninjato>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 16, 2021 at 09:32:34AM +0100, Wolfram Sang wrote:
> On Tue, Nov 16, 2021 at 08:22:23AM +0100, Andrea Righi wrote:
> > The array param[] in elantech_change_report_id() must be at least 3
> > bytes, because elantech_read_reg_params() is calling ps2_command() with
> > PSMOUSE_CMD_GETINFO, that is going to access 3 bytes from param[], but
> > it's defined in the stack as an array of 2 bytes, therefore we have a
> > potential stack out-of-bounds access here, also confirmed by KASAN:
> 
> I think a comment in the code why the array size is 3 when only 2 values
> are defined would be helpful. Like a short summary of the above.
> 

Good idea, I like it, I'll send a v2 adding such comment.

Thanks!
-Andrea
