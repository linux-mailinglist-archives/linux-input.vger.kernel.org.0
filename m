Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DFF482C7B
	for <lists+linux-input@lfdr.de>; Sun,  2 Jan 2022 18:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiABR4Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Jan 2022 12:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbiABR4P (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Jan 2022 12:56:15 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2D8C061761
        for <linux-input@vger.kernel.org>; Sun,  2 Jan 2022 09:56:15 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id v7so65764882wrv.12
        for <linux-input@vger.kernel.org>; Sun, 02 Jan 2022 09:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S7GxlDgey1kwXykVVyTspe31PgfYhzlqLUHxU+d6RUM=;
        b=qE1BndaENP2/toJZ2ycKLspHGqofBwwT7ig494wLoe7E0PLfQDwLZuCs06TW+jMlms
         SQcLq4r+KPpsfbNpVNYLIQLa4iJi+seum/gAn17ABGX9lV49GvWiexWIBELRnWJa8K1Z
         KeyUwKDn1rA8n+SFZpsbP+ty78jBvjWNElUnjTER6spAwTJ/tG9lZhXsayUaKeT+0dMo
         I1kkGrUm8HW2odHL5LKiLX2XwkMFthK/VTvMGCk3H1lbXOENOBKT402y4Pj7U4FaIuzt
         3supqEC4SZI0RPwuEMPoQe5So/jJvCNwM7nVxr+bRL0IgyOAOR8S3zkS2yF12InC+iL8
         4aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S7GxlDgey1kwXykVVyTspe31PgfYhzlqLUHxU+d6RUM=;
        b=u8DY+Un235ghXI0MUaJU2fsSmKV6ET99Vhd7HOw+Y8sI/mpvauEPt6aevOY++HAvSH
         nqVkFGB2tAYu0M6MEueeES2QP/cj0aJJ2+xtD2jXsVpUEd+CNZgVKcor6N9eexM7GacD
         H3jxBYOk8CrJW+qc/jJVdkFdiN8Q4xRZ7bBW4nRzHwOpfrKew00On/dvv4LwPAu3AKaP
         ZkD+Xltd0T+Xb8biRfXsoCY0JStKljm5y9Oc8A9MrbHlZYlmPp3y8L57LPNGoBkQ8ah8
         npaEmC2ZSAXxoQst4WPsFqH4fZbV9+Wb1JJr26MybAOp7RCmvQ7ivk8dXMVWCWITDhgQ
         KKQg==
X-Gm-Message-State: AOAM530aR2qp0ay1E/oP5TQbdkqP1R7c/7iqeafwbKQCYxbFRxReyCHQ
        b5blSjCK9W8PJHw7MYUuZ0k=
X-Google-Smtp-Source: ABdhPJyZsaCZ81GRO1kwsVlNtoAC7A52B5FQUbKIYcI0KUBi7qUbVLi2qRpIYn+nFlfoBwPnJ29s4A==
X-Received: by 2002:adf:de03:: with SMTP id b3mr9476911wrm.448.1641146173331;
        Sun, 02 Jan 2022 09:56:13 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id s189sm43569450wme.0.2022.01.02.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 09:56:12 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     benjamin@sipsolutions.net
Cc:     alexhenrie24@gmail.com, bberg@redhat.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH] HID: apple: Add 2021 magic keyboard FN key mapping
Date:   Sun,  2 Jan 2022 18:54:39 +0100
Message-Id: <20220102175438.175359-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108125038.125579-1-benjamin@sipsolutions.net>
References: <20211108125038.125579-1-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Thanks a lot for the patch Benjamin.

I tested it on the Magic Keyboard 2021 without fingerprint reader.
ANSI, ISO and JIS versions.

Works as expected a code looks good to me.

As sugested by Alex, I mailed a patch adding support for the
keyboards with fingerprint reader and/or numpad [1].

Tested-by: José Expósito <jose.exposito89@gmail.com>

[1] https://lore.kernel.org/linux-input/20220102175113.174642-1-jose.exposito89@gmail.com/T/

