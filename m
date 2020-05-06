Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8AB1C7394
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 17:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbgEFPGf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 11:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbgEFPGf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 May 2020 11:06:35 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71F6C061A0F;
        Wed,  6 May 2020 08:06:34 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l25so1213108pgc.5;
        Wed, 06 May 2020 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eGi1L9urtaKBeDDvITR0UZqtmPEwGeW5Feo5TNhoZDY=;
        b=ipAclyHS2TH4DohF7rE2zwbG6ue8HaSV1QL+S7svkhP5ku3RZGC/NDpML1g82C7o9e
         VMX9vLSxxMroeLVOdJVyqmOaaSTt4fBkf5laIHqdhG3rKqbNEpEGf3+OfO9UxoFFAqgJ
         NcGfqu0tFw3JSorEWfrJxu7puP7QC806g3mV93zzCU5mI+EK5jhlpEuirwoWOl8r1SMH
         Kp5PA8BPsaVUNO6b6OJef1J1pxIbIF0tF9VaITj2kdUCeyGx5emB0S77w+WFe/U2q2bJ
         FtjXaAZfi/H90mACFFHSEwBp+eZkOtSV5iIFVul3suUcTz4OtBtkuBTEUBVadSH/h2U8
         vQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eGi1L9urtaKBeDDvITR0UZqtmPEwGeW5Feo5TNhoZDY=;
        b=tASrxi/1iRNoVY1yiaB9eekErPg3gi0iLxY4AMaEPw0O/5TqaZJp7bO/6EK8zYG6zw
         AkSsqbSWVW6EDP073ZU2H68TVtYXbC9hLAi9zPPZeAl6v3YuR+aMwi4mGWWm2biF7P7R
         PIV1z51P/hTfxehMo29mPcWGkwTZMvaR3ef6bXxaxG1K+WCL9ywCSOhl9QNDZZCHzwrm
         AoKfkxOWS7but+9Dsef354HYomi/uqOKrj9Qz58OpnYkwAzOV8A1VGTvypZuoil8MPna
         UImhrWpDNCwNVtnwY+FJeyXZ/ARWkA7KrUiuqQfT24SgSQdBrbUaGvN+xC3WioAIHQj4
         Owzw==
X-Gm-Message-State: AGi0PuZK0kUWM4HmfvvTOuJhP6cyfWzQUM8h6l41e2B2yWB8XSseMDmi
        YJ3vUGDBaxjIeVp894Swznw=
X-Google-Smtp-Source: APiQypJzopv1LfupQ5DisVLznReQcQbfRpVCydPqhzCm2nKxQ6CPn7126fMo1Ei12s8d7fHU7jse0A==
X-Received: by 2002:a63:da01:: with SMTP id c1mr7678309pgh.121.1588777594380;
        Wed, 06 May 2020 08:06:34 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:712:fa06:497c:9578:5fd7:4b29])
        by smtp.gmail.com with ESMTPSA id u13sm5050259pjb.45.2020.05.06.08.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 08:06:33 -0700 (PDT)
From:   Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
X-Google-Original-From: Aishwarya Ramakrishnan <raishwar@visteon.com>
To:     gregkh@linuxfoundation.org
Cc:     aishwaryarj100@gmail.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Ondrej Jirman <megous@megous.com>,
        =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: edt-ft5x06: Use DEFINE_DEBUGFS_ATTRIBUTE to define debugfs fops
Date:   Wed,  6 May 2020 20:36:22 +0530
Message-Id: <20200506150623.3841-1-raishwar@visteon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505153325.20113-1-aishwaryarj100@gmail.com>
References: <20200505153325.20113-1-aishwaryarj100@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>

On Tue, May 5, 2020 at 11:49 PM Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> On Tue, May 05, 2020 at 09:03:24PM +0530, Aishwarya Ramakrishnan wrote:
>> It is more clear to use DEFINE_DEBUGFS_ATTRIBUTE to define debugfs file
>> operation rather than DEFINE_SIMPLE_ATTRIBUTE.

> No it is not, why do you think so?

This change is suggested by Coccinelle software.
Generated by: scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

> The two defines do different things, that is why we have 2 different
> defines.  You can not just replace one with the other without
> understanding why one was used and not the other one.

> Did you test this change to verify that everything still works
> properly?  Why is it needed to be changed at all?

DEFINE_SIMPLE_ATTRIBUTE + debugfs_create_file()
imposes some significant overhead as compared to
DEFINE_DEBUGFS_ATTRIBUTE + debugfs_create_file_unsafe().
But I missed to use debugfs_create_file_unsafe() function in the patch.
