Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E101CE215
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 19:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730923AbgEKR6Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 13:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727051AbgEKR6Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 13:58:16 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CC7C061A0C;
        Mon, 11 May 2020 10:58:16 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u5so2295854pgn.5;
        Mon, 11 May 2020 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ewo7Y6chWzahC/8uHySmz/oT41IZaTGhAlBYldBBuQw=;
        b=jq6yCf1on4G5aYtuEuUT/5x8AgA/e10+UJpR66YTZ4xAqONxQ20Wqo6dB0mTU3RA0/
         Q7maQBYjHAob1exPPkrXB9qTztnAn+6RfvganSez2vkpn+bRVbMAMckoVvpQH2rSgsGO
         T6+/SgZ5o4c2WSLcYBxZdvgHi5uZeXTUfGqWbyXeVo/ufD6SXJi3fZ6+nP7c9RfOW8bi
         SFfda5RcmXkiYqVW71RiQWTuU6mog+W8c9SNEnYHBLZXjnyzFPQFwE20whMXa2Ef8PQa
         wWjaBA+7JGdyrugFUBDeH12/MWEzdFxOle/bmlumskblHLzdAytaP+iY7L6kGoCrBlbB
         XvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ewo7Y6chWzahC/8uHySmz/oT41IZaTGhAlBYldBBuQw=;
        b=NLTUsu4AXzH4Dzj8sYuMikAlj1hG1zZyzK8UtgT+IkdKXWYN27PdJXoLNk9+d8uiRS
         FJ0TNvSNtcxPgYRWOLhN7j6Zj9BJsAoMO30VjDMK7qonEvNqE+8VhnqkqO1s4XPq7qLR
         8MDy5y8vLQJohY4+pYHVHaBP6UUQjrx+R9w7xWrMBvv8SFemTfV7urXtw9gJs12b8qPl
         Q803UND51/drOnqDCyXL143d5Eg1b9kDw96WgthuQvY8zDd8HVXifD4F9C3ePWxoi0cw
         3eqrrqKQiveK70rRokgK9cT4Q+uaDRZXNFZwvHvmsIdvB4Yg93E4R53lj992XNlwq1AI
         Lrtw==
X-Gm-Message-State: AGi0PuZvyA+LRScPYUxW3y8hEe3Zg91h8Qxob6g6+1geQf0C+qxh1xmH
        ZGJ6TO7lUDYR3JZajbd4aOY=
X-Google-Smtp-Source: APiQypLgJTSjPkJBquxFQkWlJ+oMPfi2kDwo3EYV9AIu9TpKlNo6XUHoSBwNEVpvrBx26HqJOliHrg==
X-Received: by 2002:a65:5cc2:: with SMTP id b2mr15377905pgt.7.1589219895468;
        Mon, 11 May 2020 10:58:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id h8sm9687544pfo.143.2020.05.11.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 10:58:14 -0700 (PDT)
Date:   Mon, 11 May 2020 10:58:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Subject: Re: [PATCH 1/6] tty/sysrq: Remove linux,sysrq-reset-seq
Message-ID: <20200511175812.GT89269@dtor-ws>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
 <20200511135918.8203-2-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511135918.8203-2-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrzej,

On Mon, May 11, 2020 at 03:59:13PM +0200, Andrzej Pietrasiewicz wrote:
> Nobody in the tree uses linux,sysrq-reset-seq in Device Tree source files.
> Remove the corresponding code.

Unlike platform data, we do not require or even expect that all DT users
be present in mainline, so absence if references to a feature in kernel
can not serve as justification for removal. Consider the fact that we
support DT-style binding in ACPI (which is BIOS/firmware).

That said, I am not against removing this support, but we need to make
sure that Android (where this came from) does not use this anymore.

Thanks.

-- 
Dmitry
