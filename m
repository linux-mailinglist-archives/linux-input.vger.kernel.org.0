Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D0B2428AC
	for <lists+linux-input@lfdr.de>; Wed, 12 Aug 2020 13:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgHLLcW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Aug 2020 07:32:22 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:35006 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgHLLcW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Aug 2020 07:32:22 -0400
Received: by mail-ej1-f67.google.com with SMTP id a26so1881214ejc.2;
        Wed, 12 Aug 2020 04:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=brfsqhn404ISuUjobpKwYoB7OONsvgdICzG9pW1COa8=;
        b=ox4/vLmOArkZIU4zP4UZRubOcRLb7izkW8U1E9ZcG9Z64pK3RJjP4ccYlG4esfIuoA
         YvLy8h/VYwcQpurKpjlYL+3LpElUfn+0HdrcL6AIOj6/iXWwastgZLK1Oz/AsCcy2e2U
         1PxlWr79bt/V94pFka1ipAKWALi37JQIGV/SlfRdLZDSrLqidMBrRGax/3g6e4BwI6YM
         6abJ+gjIk6S9v3yy+FoAa9tgxEkTHvQTOoXQeVkSctoWXQRKDiro2gacoRDkjpvhHuYO
         +fgwjLAcSm9kzbxSU25qtuJe77UBiNdier3iSL9ceqyMufTcpuGBn8lDmd/abUIA5UuJ
         v2Gg==
X-Gm-Message-State: AOAM530My2kX9SZEFimgLzFFbjKtgI8F5/6AHBawgaJkTbCTrx3iNHSV
        sruEURGGD/3BbfneQkY7sWBCbTgs
X-Google-Smtp-Source: ABdhPJwznBtRzEdV1RdC0CPkobZwQIGHVvjO+eisjr86rW5D2FGCrOzHZiHBUFz8C8OVUpOoQ54d9w==
X-Received: by 2002:a17:906:4094:: with SMTP id u20mr30065707ejj.553.1597231940422;
        Wed, 12 Aug 2020 04:32:20 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id y26sm1265142edu.96.2020.08.12.04.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 04:32:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] tty/sysrq: Extend the sysrq_key_table to cover
 capital letters
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel@collabora.com
References: <20200804162402.2087-1-andrzej.p@collabora.com>
 <20200804162402.2087-2-andrzej.p@collabora.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <344cb9b6-c490-c1f5-18df-46e4215f361b@kernel.org>
Date:   Wed, 12 Aug 2020 13:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804162402.2087-2-andrzej.p@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 04. 08. 20, 18:24, Andrzej Pietrasiewicz wrote:
> All slots in sysrq_key_table[] are either used, reserved or at least
> commented with their intended use. This patch adds capital letter versions
> available, which means adding 26 more entries.
> 
> For already existing SysRq operations the user presses Alt-SysRq-<key>, and
> for the newly added ones Alt-Shift-SysRq-<key>.

You need to update the help_msg of sysrq_drm_fb_helper_restore_op. It
states sysrq-V (capital V) is the right one. From now on, it isn't

thanks,
-- 
js
suse labs
