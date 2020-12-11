Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228D22D805F
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 22:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgLKVEs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 16:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392579AbgLKVEX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 16:04:23 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757FCC0613CF;
        Fri, 11 Dec 2020 13:03:43 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id l23so2983843pjg.1;
        Fri, 11 Dec 2020 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FW3Jn0vqNZtYaAqeCBfAsxmpQC1nOxPoiNqMyp0VCcs=;
        b=h9z8GJs6P2P3VQUWznM6j7otNaSj7HAot0lyTD90cbzVAi57jiRIlOojZQcHn1iayM
         1OHGc/iY0xG+1nQFYjYr1yf/lRh1wHYKIjpwqBxUIe2ZhKQ2mASYRmnBRCcIeo+k81rw
         CFrYuHeUtgs3XT+5SNX/deoVsrcz2KCvQQH1dfufGWf9MkYAjo3hhXqMXDDI0P3TRNjI
         U+9u5oKu99yDnQXI/rwoFCPD5tbHnXL40mqlEj5V5sNiiq3S6Ax2Bw4rjs5KA5KabMuJ
         pwiYm9MXNxKYMbVAobDczXL/sOY3EUuw1FOuhGuZ93Bv+nztXuw+cpq6eUnmtSzcUenO
         gmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FW3Jn0vqNZtYaAqeCBfAsxmpQC1nOxPoiNqMyp0VCcs=;
        b=PBkjz1CxBSpiCZz33GxbX3ge98uP74c4dATXU8S1XWzKMZP0lkAFYngLClImzd1fZZ
         NMwirzRWnWBr/+q0Nkiu7+AYcPUjM4xH55qoVwHa0bB1ASTfYqFOC62Jj1ABDruOSKCY
         FvGBE/GmKU6Q/8EFmKGWUWXuusEdkVIpuljZKCuEK0xrale9rwQcOm7pTCwYhQFr/PWt
         hOZKXHxyqZMYxuPeZK+tyDHJ3fqZWj53UgNuNoMHkY+vS3xH5d+Sk57Uz3tLKeH4o7LC
         z2WzdcMKGyzfp0ZOS/1UWrIRdS6nsoQ0S8bBzt886Hqkhblax5Wa+JwHQVDNuDKmPKUm
         b26w==
X-Gm-Message-State: AOAM532ZkULlh0qYFDUHf9zrv69TAhbSl/sldoyF6KZ2gG9DZR47nCIY
        A0A6hAqNbPFEa+EIhlpSi7M=
X-Google-Smtp-Source: ABdhPJyrxifeDm2990qMQnXO6+v7Nj5kUmMlMgaW+YQ+osT28QA1eyMNI3OMchn6asNbFUmt35mPAw==
X-Received: by 2002:a17:902:7c0a:b029:da:62c8:90cb with SMTP id x10-20020a1709027c0ab02900da62c890cbmr12724872pll.59.1607720622974;
        Fri, 11 Dec 2020 13:03:42 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s7sm11831632pfh.207.2020.12.11.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 13:03:42 -0800 (PST)
Date:   Fri, 11 Dec 2020 13:03:40 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] input: misc: convert comma to semicolon
Message-ID: <X9PerOno8j+Dk4js@google.com>
References: <20201211085032.2598-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211085032.2598-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 11, 2020 at 04:50:32PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Applied, thank you.

-- 
Dmitry
