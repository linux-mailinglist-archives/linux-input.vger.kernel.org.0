Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6EA5324608
	for <lists+linux-input@lfdr.de>; Wed, 24 Feb 2021 23:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233387AbhBXWAc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Feb 2021 17:00:32 -0500
Received: from ganymed.uberspace.de ([185.26.156.242]:39742 "EHLO
        ganymed.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhBXWAb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Feb 2021 17:00:31 -0500
Received: (qmail 7381 invoked from network); 24 Feb 2021 21:59:46 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ganymed.uberspace.de with SMTP; 24 Feb 2021 21:59:46 -0000
Subject: Re: Support for X1 tablet keyboard (was Re: [PATCH] platform/x86:
 thinkpad_acpi: handle HKEY 0x4012, 0x4013 events)
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>
Cc:     linux-input <linux-input@vger.kernel.org>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de>
 <be3f6a0f-281f-975f-70c2-b167adb5547c@redhat.com>
 <64a4f249-f90b-c6b2-887f-55a016d93c65@a-kobel.de>
 <29961a1a-a66a-e732-ff7c-c7f2da52a83d@redhat.com>
 <b1392cd8-eefc-4fff-d327-5159714ba304@a-kobel.de>
 <b61d2451-f9f2-1b2c-bd7b-193713d87dbc@redhat.com>
 <7007c7e4-c24f-93a1-53e4-bd497e2d7e83@a-kobel.de>
 <d5878c95-0e0f-7119-bdf7-2ee5f504f08f@redhat.com>
From:   Alexander Kobel <a-kobel@a-kobel.de>
Message-ID: <7263ee42-b18f-34ce-bc62-9a4efde1edd0@a-kobel.de>
Date:   Wed, 24 Feb 2021 22:59:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d5878c95-0e0f-7119-bdf7-2ee5f504f08f@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms080103060504030601050902"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms080103060504030601050902
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 2/24/21 10:00 PM, Hans de Goede wrote:
> Hi,
>=20
> On 2/22/21 1:31 PM, Alexander Kobel wrote:
>> On 2/21/21 5:30 PM, Hans de Goede wrote:

<snip>

>>> The input report used by the Fn + key "media keys" use a 24 bit repor=
t
>>> with 1 bit per key. The standard keyboard interface uses 1 byte per
>>> pressed key (with a maximum of 6 pressed keys) where the full byte
>>> encodes the scancode of the key. Normally SysRq is 0x46 but for some
>>> reason your keyboard is sending 0x9a you can map this by adding the f=
ollowing
>>> to the mapping function:
>>>
>>> 	if (usage->hid =3D=3D (HID_UP_KEYBOARD | 0x009a))
>>> 		map_key_clear(KEY_SYSRQ);
>>
>> And the same here, I think. Works with return 1; after the map_key_cle=
ar, see the attached function.
>=20
> Ah yes, I forgot the return 1, sorry about that.

No problem, nearby pattern matching and copy-paste is a great way to lear=
n sometimes. ;-)

>>> Likewise for the sleep combo:
>>>
>>> 	if (usage->hid =3D=3D (HID_UP_KEYBOARD | 0x0072))
>>> 		map_key_clear(KEY_SLEEP);
>>
>> This seems unnecessary, as the sleep combo already emits KEY_SLEEP. Wh=
ich I don't quite get, cause - if I learned correctly how to read the rde=
sc - sleep should be on 0x0072 should emit F23 (and 0x0078 sleep), but th=
e key produces the 0x0072 pattern according to hidraw.
>> By the way, the Fn+4 for sleep also works in hid-generic, and also jus=
t once, see below.
>=20
> Ok.
>=20
>>> ###
>>>
>>> Note chances are you have more Fn + 'letter' combinations at least on=

>>> the thinkpad10 kbd I have:
>>>
>>> Fn + T -> SysRq
>>> Fn + I -> Insert
>>> Fn + P -> Pause
>>> Fn + S -> Sysrq
>>> Fn + K -> ScrollLock
>>> Fn + B -> Pause
>>>
>>> Note these do not need any special mappings on the thinkpad10 kbd and=
 I guess
>>> the doubles may have something to do with some non qwerty keymaps.
>>
>> Not the same on this keyboard. I have Fn + {B,K,P,S,End,4} for {Break,=
ScrLk,Pause,SysRq,Insert,Sleep}, but only SysRq was missing; the others a=
re available on the "default" device, both with hid-lenovo and hid-generi=
c.
>=20
> Ok.
>=20
>>>> The ugly:
>>>>
>>>> Fn+4 ("sleep") triggers the appropriate ACPI event button/sleep and =
emits something on /dev/hidraw0, too, but *only once*. After resuming, no=
 reaction at all (neither on ACPI nor hidraw) until I unload and reload t=
he hid_lenovo module.
>>>
>>> As for the sleep key working only once, what happens after a suspend/=
resume ?
>>
>> Nothing. At least nothing I can measure (via evtest, libinput debug-ev=
ents, cat /dev/hidraw*, dmesg, journal, acpi_listen). The key simply does=
n't react anymore.
>> Irrespective on how I wake the device. Even irrespective of whether I =
actually suspend the device or disable the sleep handler altogether, e.g.=
 by systemd-inhibit. In only see the KEY_SLEEP press (no release!) event =
once until I reload the module or unplug and reattach the keyboard.
>> Very strange. And, by the way: the same for hid-generic.
>>
>>> I think the key may have some special handling to avoid it sending
>>> a second KEY_SLEEP when the user uses it to wakeup the system, to
>>> avoid the system immediately going to sleep again when the user tries=

>>> to wake the system this way.
>>
>> Yes, that'd make sense. So probably the handler should restore somethi=
ng; apparently, that part is initialized when the module is loaded, so it=
's not just the keyboard firmware.
>=20
> Maybe echo-ing to the fnlock attribute resets the key ? The driver does=
 always force the fnlock LED on when it is loaded.

Good catch, but that doesn't help, either.

It's only a minor nuisance, though; in any case, it can be worked around =
by reloading the driver in a resume hook. If one actually wants to use th=
at button; I personally won't.

>>>> Finally, keyboard backlight is handled in firmware, apparently; Fn+S=
pace is visible on /dev/hidraw1 (see attached capture), but it toggles th=
e backlight levels without any userspace code involved, as far as I can s=
ee.
>>>
>>> Yes I saw this in your dump, this is really weird because it sets 3 b=
its at once in the INPUT(3) report.
>>> Does it always set the same 3 bits independent of the brightness leve=
l ?
>>
>> Yes; the four key presses are actually one full cycle over off, auto, =
dim, and bright. hidraw dumps are identical.
>>
>>>> Also, the keyboard backlight doesn't create an entry in /sys/class/b=
acklight or the like, so neither read nor write access. Out-of-the-box, a=
t least. But I'm not even sure if this is possible in Windows.
>>>
>>> Actuallu kbd-backlighting used the /sys/class/leds interface, but yea=
h that is not support by Linux ATM for this kbd.
>>>
>>> Yeah, adding support for that (assuming the hw can do it) would defin=
itely require making some USB dumps under Windows
>>> (after finding sw which can change it from within the OS under Window=
s).
>>
>> I double-checked; somewhat unsurprisingly, there is at least a notific=
ation client on Windows that displays the new configuration after Fn+Spac=
e. The client only reports the setting; not sure if it would be technical=
ly feasible to also set the brightness level in software.
>=20
> We could try asking Nitin if he has any info about this, but I agree th=
at this is a low priority item.

Ack.

>> But anyways: I feel that I exploited your generosity in helping me far=
 enough. I hope I wasn't just fed, but learned a bit how to fish for myse=
lf in the future. So, unless you're really committed to walk me through t=
his further, I won't beg any further.
>>
>> And in case you're looking for problems to tackle on the Tablet 2nd Ge=
n, this one about the power button could be way more significant - but no=
t sure if it's in an area that you are familiar in:
>> https://bbs.archlinux.org/viewtopic.php?id=3D248857
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D204763
>=20
> I see that you have already tested the patch which was posted for this,=
 so I assume that this is resolved now ?

Correct. I resurrected the bugzilla task shortly after my last mail, and =
Alban cranked out a patch with you in CC within few hours. Didn't want to=
 add more noise here.

>>>> Bottom line: this is mostly usable already, modulo the adjustments f=
or the different keys. I'd like to make F10 to F12 work before it hits te=
sting; everything else is icing on the cake, I suppose. Do you have an hi=
nt for me how I can approach that?
>>>
>>> See above, I think we are pretty close to solving this.
>>
>> Attached is the modified version of the input mapping for this keyboar=
d, working subject to the above mentioned restrictions. I think this is f=
ine.
>> As you did all the real work, I feel this should be your contribution.=
 But of course I can also prepare a patch on top of yours.
>=20
> I think you're underestimating your own contribution here...
>=20
> For cases like this we usually add a co-authored tag. Since this applie=
s on top of another hid-lenovo series which I recently send out it is pro=
bably easier if I upstream this, that I agree on.
>=20
> I would like to attribute your work though, so I would like to suggest =
adding the following 2 tags to the commit msg for
> the "HID: lenovo: Add support for Thinkpad X1 Tablet Thin keyboard" pat=
ch:
>=20
> Co-authored-by: Alexander Kobel <a-kobel@a-kobel.de>
> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>
>=20
> Alternatively

<snip>

> But I believe that co-authored-by + s-o-b are more appropriate.

Okay, so be it. I trust your opinion here.


> If you can let me know which one you prefer, then I will drop in your f=
ixed lenovo_input_mapping_x1_tab_kbd() function, remove the WIP from the =
commit subject and submit the last 2 patches of the set which I send you =
upstream (the rest was already submitted earlier).

co-authored-by + s-o-b it is then. Ack for the rest.

>>> Note in the mean time I've posted a hid-lenovo patch-series with vari=
ous improvements related to
>>> the LED handling. I'll send you an offlist mail with the latest patch=
es so that you can base any work you do on top of those.
>>
>> Didn't have a look yet, but will do.
>>
>>>> Also, I'd make sure that this is about the "ThinkPad X1 Tablet Thin =
Keyboard **Gen 2**". The consumer functions are different for the **Gen 1=
** keyboard, so I would also adjust the function names. I do have an old =
Gen 1 keyboard lying around, but unfortunately it's either broken (it lig=
hts up shortly after attaching in Windows, but doesn't report keypresses =
at all, and pretends to be completely dead in Linux), or it's incompatibl=
e with my X1 Tablet 2nd Gen. So I cannot test how your patch might impact=
 the Gen1, too... :-/
>>>
>>> I would expect the Gen1 to have a different product-id, so my patch s=
houldn't do anything.
>>
>> Right. In this light, perhaps the function should still be called leno=
vo_input_mapping_x1_tab2_kbd (note the "2")?
>=20
> Well drivers/hid/hid-ids.h has this:
>=20
> #define USB_DEVICE_ID_LENOVO_X1_COVER   0x6085
> #define USB_DEVICE_ID_LENOVO_X1_TAB     0x60a3
> #define USB_DEVICE_ID_LENOVO_X1_TAB3    0x60b5
>=20
> And I guess that the COVER might be the X1 gen1 product-id ?

AFAICS, yes; confirmed by a quick web search. So it'd be more apt to

#define USB_DEVICE_ID_LENOVO_X1_TAB     0x6085

#define USB_DEVICE_ID_LENOVO_X1_TAB2    0x60a3

#define USB_DEVICE_ID_LENOVO_X1_TAB3    0x60b5


but I have no way to really confirm right now, so I'd also be in favor to=
 leave it as-is.

> Your working kbd is using the USB_DEVICE_ID_LENOVO_X1_TAB id. note not =
TAB2 just tab.
>=20
> I don't know, but it is not all that important really, we can always re=
name both the #define USB_DEVICE_ID_LENOVO_X1_TAB and the function later =
if there is a reason to do so.

Ack. Better have #defines and function names in sync and think about more=
 interesting stuff. ;-)


>> Thanks a lot,
>=20
> You're welcome and thank you for helping with improving support for Lin=
ux on these devices.

Ditto!


Cheers,
Alex


--------------ms080103060504030601050902
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
Ew0wggY9MIIEJaADAgECAgg3B676YzbKKTANBgkqhkiG9w0BAQsFADBSMQswCQYDVQQGEwJE
RTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxKjAoBgNVBAMMIVZvbGtzdmVyc2NobHVlc3Nl
bHVuZyBSb290IENBIEcwMjAeFw0yMDA1MjYxMzIxNDFaFw0zMDA1MjUxMzIxNDFaMFUxCzAJ
BgNVBAYTAkRFMRcwFQYDVQQKDA5GcmF1bmhvZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJz
Y2hsdWVzc2VsdW5nIFByaXZhdGUgQ0EgRzAyMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
CgKCAgEAzW9OcLabPtfz9rbgtyyuNQCQkmI8cPW39VGsXLX1J9EIcUPvp1ysi6kuqMfw+YOC
LjxopSIhpjhH/p84LzmcBJElRPkzWHJreZry+Lu5SDhOcOH49fNEo7UeYE0wkSJNv+jLMWwU
H93dPaSNeRN/5/Peq6tcKTx0FflS2ZScP9OcPvXgp1c/bXYoRyiOGSVR8/+7qlwNuku2px6f
0c6XOKOwkyTeSghmQ8vdfeqcMd9fNUhn/ijWFHahr0LUGB9We6SoxklOz9gfgSCjhInt+4qy
N6bHl/utH/vj1qnuhkaP25h1eCbz2WKqv0wKWwa/r4F0ItLYYP2YhwICTNLDDT8GmctRdt2S
yLmgXo9Gz0nrwrYuGMWcXNLm682Fgg3wQne0DTszFFUU8PrVOtgzB5Qm6DPrRSUHXQEfT7DY
ZzDA+FmSoTSiCe+aoNPbglta4gDar0B/gni15LtCzW4tNhk3fXkYxEWpbq32vNy3wCDOQazc
vxzko5Ior1iDZJNuzurtp5qRjAnOcUiKhNUJeBnmLDB/Di9XZHIQCD0EjiZzef0OR4+ZbPPM
xl6n9KHdrZ2c8r3yjGJtGkeMc0aMkBpvYNDy/s4fYnE5MRIOWdmMnq23/DvCpsQtF5UWZlF9
MaKVcjXmtGpnhpe0XOkFXvxd9PSM0Oe4uei+buhbF7ECAwEAAaOCARIwggEOMBIGA1UdEwEB
/wQIMAYBAf8CAQAwHwYDVR0jBBgwFoAUPnwBB805qJCxODW0j7v1rBeEocAwTQYIKwYBBQUH
AQEEQTA/MD0GCCsGAQUFBzAChjFodHRwOi8vdm9sa3N2ZXJzY2hsdWVzc2VsdW5nLmRlL2Nh
L3Jvb3RjYV9nMDIuY3J0MBQGA1UdIAQNMAswCQYHKyQPCQMBATBDBgNVHR8EPDA6MDigNqA0
hjJodHRwOi8vdm9sa3N2ZXJzY2hsdWVzc2VsdW5nLmRlL2NybC9yb290Y2FfZzAyLmNybDAd
BgNVHQ4EFgQUBNGCAAc5XwIAgrw4HtCXwN3HOwMwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3
DQEBCwUAA4ICAQAPsI1fETAPUfq7LoI2FxRDylRduC/nVhVca7ORxhZXrFmksT/q1jHU4eXK
IhcVms623/FHhcVHl1qB5G/cgU2OtjEP5/BXIRu4I78EZIhb8U3ZGe9gZql/RSOBD08lhmzv
fRz+nwE2Pl9stzXKohjGRWyfFfuaWKLXUZzCK/wYX6IqhTxjkoEFSgejoO41B886rrm3+aaO
5Db5EBW4gYWF9VCV3bmedmTJzbvOOYDxaVT1+O8E9Ym5BZL+qJNjgdjJXE1TUGyUg6ZweNHT
dse6xTc9KhfnAyppkMUu9AKT6jkloA6l0/T3zEMKhvtf9gLYWJ0zMwm1JfQk5mVMZtQoOPYI
Wj7IVUKPZJMizHoaAAIzi7C0w3XpN3xMDJOs5eRsRPk0qF8UulshIUA/6idOrg7eUY4WZGN1
RZsFYyhBg1sPaeFyFAUs0XJUrWLOKO5f9VZGbmEF6gqbTxdwMCJZzonwpUxVwxKLMa+Z4EMG
QoY1rLNPCRZlzhW+TRBsuy4tGN21PlhvcvEnxs8eHvqlwfM/KwYtXhLG8881KMMSzemRvX/c
pNCU2YlHpAwpdm6cAn60leS0WPfTb6QAqmtQTij6uAfFN46hQDLqpfTWnoPSMvbeyFwqP6Fv
V6RgquAIpe9p5daLY9M+Krkd7mH8QR2PN615TboR0ocoF4REdTCCBlwwggREoAMCAQICCBUM
N0NLozG+MA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYTAkRFMRcwFQYDVQQKDA5GcmF1bmhv
ZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJzY2hsdWVzc2VsdW5nIFByaXZhdGUgQ0EgRzAy
MB4XDTIwMTAxMTE2NTIzN1oXDTIzMTAxMDE2NTIzN1owgYkxGDAWBgNVBAMMD0FMRVhBTkRF
UiBLT0JFTDEOMAwGA1UEBAwFS09CRUwxEjAQBgNVBCoMCUFMRVhBTkRFUjFJMEcGA1UEBRNA
RDQwMDNFMTc4OTlGMTQzMTI2ODExMzM0OUY1N0M1QzU0NEQ5RjcwNDVCQTkyMEJEMzdDQURB
NTQzOEFGQ0EzODCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAM9yNVKr/cuT0WnJ
PLe7kmfd5Wo7rlb1F+harCy3OLgaTqkMI6j37OTXMAmdkZ0y7zrlhbEGCEpODaDPYwVSEb+s
Cv05n3SAMCdy9kQlnqP9We7C/2mbnuKYhpO5P6mUVdPoM+tfTM22YH7CzO8sa1Tq1s/DrIZs
NhXDRvWZEdDwUCjLPKVXGtTqHbUjs7OufxpbyzA7xHE5N7qRff1WrOuq/RS1OvGZVcUjLAmI
loYCvYm1Q3oBYuSZygOsawjmJQ14fh7dKkOjogx6byElWAVBkUQxud8CtBHW+L4VY35uinRJ
k81mwI8ac0zS5FEbYWoF9Gi5pWbCgoIvGXIMcPEQqu8mVBpN/CAMUOUlIkOPDvFqfiQ9TI2C
xnNih8csWwVInRS7m8itJrnlbVfDwdHMJhPT522gCDOC6lXaRUizwGqRh/26W1dJqA2SYmEn
EMH/TcP3eyiFLN5QDXm2odnh+rbvQbwEtlPxup24HGe8RqWFdiCOW1syM+V74lUn5wIDAQAB
o4IBeTCCAXUwHQYDVR0RBBYwFIESYS1rb2JlbEBhLWtvYmVsLmRlMA4GA1UdDwEB/wQEAwIG
wDATBgNVHSUEDDAKBggrBgEFBQcDBDAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFATRggAH
OV8CAIK8OB7Ql8DdxzsDMIGCBggrBgEFBQcBAQR2MHQwQAYIKwYBBQUHMAKGNGh0dHA6Ly92
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcuZGUvY2EvcHJpdmF0ZWNhX2cwMi5jcnQwMAYIKwYBBQUH
MAGGJGh0dHA6Ly9vY3NwLnZvbGtzdmVyc2NobHVlc3NlbHVuZy5kZTAUBgNVHSAEDTALMAkG
ByskDwkDAQEwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL3ZvbGtzdmVyc2NobHVlc3NlbHVu
Zy5kZS9jcmwvcHJpdmF0ZWNhX2cwMi5jcmwwHQYDVR0OBBYEFDadSlBdeaipQdbmS4vn439F
6fkNMA0GCSqGSIb3DQEBCwUAA4ICAQBUhcmTTecspwaSgUUlrG/gUPzDLM/Ty0Jpz4GvRbRn
kJxHlHAopkk8P1SXlnOy2kfC5LgFCRB9tJqSlXmIXwphm90fZKRGZU2dBgxGkDQppXGH6PjJ
P52QAhvpztJDPEqfqkzcpKdkYuFg+KEzqZmsu8Mvy4rqCTRIAtOX5zHVFEIarp7YUMNhzGxg
eQakmDjykC1Xksx/ULsX7r5QW5Fqp1ZL5obNmA2emJgn0VrKRIYY8vqnOwUi13G/lDa+fphz
PMhpIKOKQ9Wy0Wn8mBdSdIqmt2L58Pu14ygwOkK3vnb/QKqayhwme2uf4waXG5or3wZdSr39
SvvGZT8Z6cHw6n7Jw0+gRApkB1cUO7j1T/aHCBcZPJ5i6bBoGrT5E8IHIqj+oZXUCY7jxknL
aHaiOARg8fFkf8lp3uy7ay4WcDIorPa9ugNaCP3SnYvtKvk44ulgMIjhvkG1Mga/70SA9Evq
3cFUle3jaaEYujSxLnN8LVm39dR93QCqcdkIayPA9LT6vizlGoA6BdOMWDzKWWnoelYTb+Ip
iqpafot50MCUqf1e2T0z8Ygki1LLOxlpi/DWQApb/Qq9EomeEYMKm0aJc7166pLiWsk1fWOX
kwBa3phG+CbbUxqotGP++r39Dk8Diny+lYjkRXpoqggzF9g9uxARXBIw0H+G6XbgCzCCBmgw
ggRQoAMCAQICCGRFBiAAmYjgMA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYTAkRFMRcwFQYD
VQQKDA5GcmF1bmhvZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJzY2hsdWVzc2VsdW5nIFBy
aXZhdGUgQ0EgRzAyMB4XDTIwMTAxMTE2NTIyM1oXDTIzMTAxMDE2NTIyM1owgYkxGDAWBgNV
BAMMD0FMRVhBTkRFUiBLT0JFTDEOMAwGA1UEBAwFS09CRUwxEjAQBgNVBCoMCUFMRVhBTkRF
UjFJMEcGA1UEBRNARDQwMDNFMTc4OTlGMTQzMTI2ODExMzM0OUY1N0M1QzU0NEQ5RjcwNDVC
QTkyMEJEMzdDQURBNTQzOEFGQ0EzODCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGB
AIHe4er7YlQrv+fgKBYbb2FSJLtzoB9s4ZhYgIfQuR1x9+WJvj9EMne5rsHB+OJ5bwZQ1Fnh
qhJhtepikZhLDRVfRbzRdrOSzxnkePhH/SZ9VhtN6327PuSAwxe/te/DPDo6aWZj3d7RoioE
UgkyF5gNWYu082LeSHbvNpDcHUN2Rs7XgZi5uBUnHR1btXA7BOzUMfPhEIqwuCDKLZAGCc0q
2JKhKeOIOsoZ8lP2/HfW3Az1ij6xztb/HfoZnyZMpQC1ly7VgJU5rTLRJz39kscZSBcnxRqP
8cE9rrlPZOgRPK2NR4x+30Sr9sOtnbRYldKWT4uCtqrPrnxNKiDkv3P2h1yKYbCamlqwaoJW
cjrphzLycSGHitalla/f82xHSN+7gJHGp91WYIn+c6jPLcx0wmKUJBB1TIEaeh4izkqLwB0P
1HUBHo50OdmTnRGdnvNt/+Xsc9KetVnmJM2bqXXDlgYMfsULoe6Y0AVemQFvd1V49GePGpGT
NGMe5jf7NwIDAQABo4IBhTCCAYEwHQYDVR0RBBYwFIESYS1rb2JlbEBhLWtvYmVsLmRlMA4G
A1UdDwEB/wQEAwIEMDAfBgNVHSUEGDAWBgorBgEEAYI3CgMEBggrBgEFBQcDBDAMBgNVHRMB
Af8EAjAAMB8GA1UdIwQYMBaAFATRggAHOV8CAIK8OB7Ql8DdxzsDMIGCBggrBgEFBQcBAQR2
MHQwQAYIKwYBBQUHMAKGNGh0dHA6Ly92b2xrc3ZlcnNjaGx1ZXNzZWx1bmcuZGUvY2EvcHJp
dmF0ZWNhX2cwMi5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3NwLnZvbGtzdmVyc2NobHVl
c3NlbHVuZy5kZTAUBgNVHSAEDTALMAkGByskDwkDAQEwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0
cDovL3ZvbGtzdmVyc2NobHVlc3NlbHVuZy5kZS9jcmwvcHJpdmF0ZWNhX2cwMi5jcmwwHQYD
VR0OBBYEFJiKTcJJSCtBVQS6oS4OSO8QKEWBMA0GCSqGSIb3DQEBCwUAA4ICAQBfdnVpzlnO
JupsJfdYW9xyt3lSky85oA1qPichmW6UjrnIZdunQPJrCTTM+7wUqeqwlhbRmwUKgAPH/5fc
cOnyMulgbvc50VV+mBK4ph/1/fhom7zJYEfvKEpPWg5tGx3/Mp6YIVvuhRnZ7vmodMGXgj/f
1D7yHFJib/430e6pcD76DPaAFA1cVVp5FUP+b0fBzvgYjsgSwL2GTXXaNGEaLqBuhtmInBh/
y4X2ZEz8kw6B2P0GpQ8jg+5I1tNM6vf/KH2FxDj/ykmSsgtyrQAddEjrNQbaQAzXTtHAPui/
6/wbgYfLp05aH7PsLsKGdDS9yb8UaWfWgwFuFz3dLXSdI3YYhXB2QnASX5RV3ndnu9vwGmns
c6iu4C9+h0hFdcWMIEso5K/mV/kXO31xzw7JLU2y5Nk7XEgrXwqFuX4ZruqCfw3EXP1hYnmt
OtfAaSLzTdBS0GskGGnWAs12dJrL8FysZbtX5cgWMyT1nun8ksvSodVgQ+7BA5YHTwfHussP
nPBDabaHmlOUVBi3IYZvoJ90XwuuMvVqcYeEzvuGDrssZHY2pG9DqTeXfzmUdpTfMy7zwu5K
jBPKilDLTXJkrA5wlQpSihjSQG/UPLP+YDsrEuwwBC1DbcSn5KOyMXFpfxsoSegFzb0lxPRc
6sScLr/v96FwvwWpL54Fp9dr0TGCA80wggPJAgEBMGEwVTELMAkGA1UEBhMCREUxFzAVBgNV
BAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRWb2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJp
dmF0ZSBDQSBHMDICCBUMN0NLozG+MA0GCWCGSAFlAwQCAQUAoIIBvTAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAyMjQyMTU5NDVaMC8GCSqGSIb3DQEJ
BDEiBCAMfPs3hqwGghTJ8U/GkOzAe353PyM11EpbxglAcMT5WjBsBgkqhkiG9w0BCQ8xXzBd
MAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHAGCSsGAQQBgjcQBDFj
MGEwVTELMAkGA1UEBhMCREUxFzAVBgNVBAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRW
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJpdmF0ZSBDQSBHMDICCGRFBiAAmYjgMHIGCyqGSIb3
DQEJEAILMWOgYTBVMQswCQYDVQQGEwJERTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxLTAr
BgNVBAMMJFZvbGtzdmVyc2NobHVlc3NlbHVuZyBQcml2YXRlIENBIEcwMgIIZEUGIACZiOAw
DQYJKoZIhvcNAQEBBQAEggGAtWv4oUYSbcTiMQkl8yx+TE7kcvKrd0nRzkV/yO+CLdursT3Y
0E2MiZGNu1UjNKSBs84H/VgPYKylaUXCbHvNeFuCZ+PJ11IVKfLDxCEp8u3V7dU2U4Fg0QVf
JxeTH0wP3iuWjiERJR9A5LN1pDP9YF1OPIV75RlClJVELjsOTcIxdndQDv0h88eqWQ1sjViJ
akkZ+0mF2vxuTSBrFbFaFeI9yCFUXi8QfuMO8NowJ0jTPe5ycCCYRAkXZq1qbtKTqv4ZtS9h
dkU8rWdlxjDEO6pQGdkv+NDKyvlGaeLBdhPyOY66DbQ9TxtwRSuAapVGeHKM0VokgCMpC84h
hhyFVOUEiM9wLV12ZYlueovD2ZLs8AcYqtC9+I/CSWGUUf4ygCbOudnj3tCAZLwbc4Ah1Z32
Ou55fMuvzJGGI1TdKNGJ+1kVmjqDnsJ+br+xNHnQqZqb4gil6oTitR5MeYdmPix8OXQd5IX3
QdxdBjRqisrZYRq4E8Al+1kwdrdammJXAAAAAAAA
--------------ms080103060504030601050902--
