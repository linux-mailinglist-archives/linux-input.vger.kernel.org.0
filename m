Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A920AEA7B6
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2019 00:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbfJ3XXQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 19:23:16 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41431 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbfJ3XXQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 19:23:16 -0400
Received: by mail-pf1-f194.google.com with SMTP id p26so2787109pfq.8;
        Wed, 30 Oct 2019 16:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=crdZedgJsEUhNDHFcmXoQIoFK0wBPhDuBUpe6JPSKvo=;
        b=CliY0HrnVg8FJ4Wq4+R2whhLQ3QxvhpTJE1lspOt7TXIgC6pw1ibEoc0jUni8RJ0ov
         bNJqqxJc9dId/yRjOwzXkfYE0D8ua0gGMWpm8imHgKD9SuxUe+T9RhRvmB0ROCLaW+e0
         MHMqO++FtzmPX0bw0zuyS/nUAw6JSEAb+Rl5jJMBapGrDE239J/v1wLqP6UQbyH2C6yt
         7lD6sIAnD52+JpuKy/ODpU9TBlSEDguvjbX1xfiAn9wJzWhSrPue1+erFEa/g1Ax0bW7
         KhZwpsmdS95nNW/Fvk8fM9s/yLqdwJCg02VrAYphVLeGJFj7FiNR1+h+Bfhd9N86S7mo
         clWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=crdZedgJsEUhNDHFcmXoQIoFK0wBPhDuBUpe6JPSKvo=;
        b=OeQ88By4yYwm7ftlxNENiSH/WCyxR/yMUUXjH9aBBZZcx+Wiq8OJAKE+ba2th6X6Vo
         2X0Rc2iaE1ZBSVgikTdg8GqFwzPVxJlJeVq2MmzSFn+CZc5Gk54tyiI/4w08rmwYBmc+
         uv8NHo86WF/uKl8aqGwFsBI7i3e6A4JY0AlWUIAiTYmYOo7j3+e7UKXMheUhlF2xb0hQ
         ABfo0qaWLrFQ31aBDo4jXkjKvXV2xixS73Al4hFtWK0bD1YomyQBR9t173rbOn2BOlhU
         TBC2ceLTmElqsS5B6rU5Exkvl24m2VOgYuFdy0eRgtrc6HDBXYigY3ru6NKwoBUyWTXO
         UIhQ==
X-Gm-Message-State: APjAAAWpkzAIo7AH+eLU992X8QndFG0unVIo2JcaAp+JWVGt1ZJMjmzr
        FIq/u6PIhCYXPAQ8VYDte9Y=
X-Google-Smtp-Source: APXvYqyaMO7XWhV9n5h+BlOcP48RjTk3sB8ZyfkIrmrzRB/jUwYPgcERvLeSWwXxozjY1PxP7KeByQ==
X-Received: by 2002:a63:145e:: with SMTP id 30mr2162826pgu.151.1572477794832;
        Wed, 30 Oct 2019 16:23:14 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 37sm835294pgv.32.2019.10.30.16.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 16:23:13 -0700 (PDT)
Date:   Wed, 30 Oct 2019 16:23:11 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Henrik Rydberg <rydberg@bitmath.org>
Cc:     Jiada Wang <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v4 01/48] Input: introduce input_mt_report_slot_inactive
Message-ID: <20191030232311.GK57214@dtor-ws>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
 <20191029072010.8492-2-jiada_wang@mentor.com>
 <b3de4c05-d2d1-58f8-a447-d5e127574ac0@bitmath.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3de4c05-d2d1-58f8-a447-d5e127574ac0@bitmath.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 29, 2019 at 06:13:09PM +0100, Henrik Rydberg wrote:
> Hi Jiada,
> 
> > input_mt_report_slot_state() ignores the tool when the slot is closed.
> > which has caused a bit of confusion.
> > This patch introduces input_mt_report_slot_inactive() to report slot
> > inactive state.
> > replaces all input_mt_report_slot_state() with
> > input_mt_report_slot_inactive() in case of close of slot.
> > 
> > Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> 
> NACK on this one.
> 
> We already discussed this patch and the potentially changed behavior to
> existing setups stemming from ignoring the MT state.
> 
> On the upside, what I can see this patch does exactly no difference to the
> cases where the MT state is set, so it can be safely dropped without
> affecting the rest of the patch series.

I guess Jiada's concern that we are forcing to pass tool type even
though we end up ignoring it intervally, which confuses users of the API
as they might not know what tool to specify.

How about we do:

static inline void input_mt_report_slot_inactive(struct input_dev *dev)
{
	input_mt_report_slot_state(dev, 0, false);
}

This should not change any behavior.

Thanks.

-- 
Dmitry
